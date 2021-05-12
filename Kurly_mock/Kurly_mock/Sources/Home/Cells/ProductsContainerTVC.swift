//
//  ProductsContainerTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/17.
//

import UIKit

class ProductsContainerTVC: UITableViewCell {
    
    // MARK: - Variables
    static let identifier = "ProductsContainerTVC"
    var delegate: ProductsCVCDelegate?

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ProductsContainerTVC {
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UINib(nibName: ProductsCVC.identifier, bundle: nil),
                                     forCellWithReuseIdentifier: ProductsCVC.identifier)
    }
}

extension ProductsContainerTVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("컬렉션 뷰 - 아이템 선택")
        
        if delegate != nil {
            delegate?.cellSelectedAtIndexPath(indexPath: indexPath.row)
        }
    }
}
extension ProductsContainerTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCVC.identifier,
                                                            for: indexPath) as? ProductsCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension ProductsContainerTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell: ProductsCVC = Bundle.main.loadNibNamed(ProductsCVC.identifier,
                                                               owner: self,
                                                               options: nil)?.first as? ProductsCVC else {
            return CGSize.zero
        }
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: size.width, height: 250)
    }
}
