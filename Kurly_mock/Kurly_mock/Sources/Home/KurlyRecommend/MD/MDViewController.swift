//
//  MDViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/26.
//

import UIKit

class MDViewController: UIViewController {
    
    // MARK: - Variables
    lazy var dataManager: MDDataManager = MDDataManager()
    var products: [ProductsResult] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        self.dismissKeyboard()
        dataManager.getMD(filterType: "A", mainCategoryID: "1", delegate: self)
    }
}

extension MDViewController {
    
    // 데이터 담기
    func getMD(result: [ProductsResult]) {
        self.products = result
        collectionView.reloadData()
    }
    
    // 컬렉션 뷰 셋업
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: view.frame.size.width/3 - 10, height: 285)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - Collection View Delegate
extension MDViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

// MARK: - Collection View DataSource
extension MDViewController: UICollectionViewDataSource {

    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    // 가져올 셀
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MDCVC.identifier,
                                                            for: indexPath) as? MDCVC else {
            return UICollectionViewCell()
        }
        
        let product = products[indexPath.row]
        
        let url = URL(string: product.image ?? "")
        cell.image.kf.setImage(with: url)
        
        // 상품 이름
        if let productName = product.productName {
            cell.productName.text = productName
        } else {
            cell.productName.isHidden = true
        }

        // 할인율
        if let discountRate = product.discountRate {
            cell.discountRate.text = discountRate
        } else {
            cell.discountRate.isHidden = true
        }
        
        // 할인된 가격
        if let discountPrice = product.discountPrice {
            cell.discountPrice.text = discountPrice
        } else {
            cell.discountPrice.isHidden = true
        }
        
        // 원래 가격
        if let price = product.price {
            cell.price.text = price
        } else {
            cell.price.isHidden = true
        }
        

        return cell
    }
}
