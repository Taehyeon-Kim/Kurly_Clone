//
//  ProductNewViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit

class ProductNewViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var dataManager: ProductsDatamanager = ProductsDatamanager()
    var products: [ProductsResult]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dismissKeyboard()
        dataManager.getNewProducts(filterType: "B", mainCategoryID: "1", delegate: self)
        
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }

}

// MARK: - Custom Function
extension ProductNewViewController {
    
    // 데이터 담기
    func getNewProducts(result: [ProductsResult]) {
        self.products = result
        collectionView.reloadData()
    }
    
    // 컬렉션 뷰 셋업
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: 155, height: 275)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - Collection View Delegate
extension ProductNewViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productID = products?[indexPath.row].productID
        
        let detailViewController = UIStoryboard(name: "DetailStoryboard", bundle: nil)
            .instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detailViewController.productID = String(productID ?? -1)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - Collection View DataSource
extension ProductNewViewController: UICollectionViewDataSource {
    
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    // 가져올 셀
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVC.identifier,
                                                            for: indexPath) as? ProductCVC else {
            return UICollectionViewCell()
        }
        
        let product = self.products?[indexPath.row]
        
        // 상품 이미지
        let url = URL(string: product?.image ?? "")
        cell.image.kf.setImage(with: url)
        
        // 상품 이름
        if let productName = product?.productName {
            cell.productName.text = productName
        }

        // 할인율
        if let discountRate = product?.discountRate {
            cell.discountRate.text = discountRate
        }
        
        // 할인된 가격
        if let discountPrice = product?.discountPrice {
            cell.discountPrice.text = discountPrice
        }
        
        // 원래 가격
        if let price = product?.price {
            cell.price.text = price
        }

        return cell
    }
}

