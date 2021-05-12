//
//  ProductHowViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit
import Kingfisher

class ProductHowViewController: UIViewController {
    // MARK: - Variables
    lazy var dataManager: ProductsDatamanager = ProductsDatamanager()
    var products: [ProductsResult] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        self.dismissKeyboard()
        dataManager.getProducts(filterType: "A", mainCategoryID: "1", delegate: self)
    }
}

// MARK: - Custom Function
extension ProductHowViewController {
    
    // 데이터 담기
    func getProducts(result: [ProductsResult]) {
        self.products = result
        collectionView.reloadData()
    }
    
    // 컬렉션 뷰 셋업
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: 155, height: 285)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - Collection View Delegate
extension ProductHowViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let productID = products[indexPath.row].productID
        
        let detailViewController = UIStoryboard(name: "DetailStoryboard", bundle: nil)
            .instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        detailViewController.title = products[indexPath.row].productName
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            
            // 안 써주면 attributes가 다시 적용되기 때문에 폰트 반영이 안 된다. (참고!)
            .font : UIFont.NotoSans(.regular, size: 16)
        ]
        self.navigationController?.navigationBar.barTintColor = .white
        detailViewController.productID = String(productID ?? -1)
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
        // 상품 8번부터 12번만 상세내용 있음
//        if 8...12 ~= productID ?? -1  {
//            let detailViewController = UIStoryboard(name: "DetailStoryboard", bundle: nil)
//                .instantiateViewController(identifier: "DetailViewController")
//            self.navigationController?.pushViewController(detailViewController, animated: true)
//        }
    }
}

// MARK: - Collection View DataSource
extension ProductHowViewController: UICollectionViewDataSource {

    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    // 가져올 셀
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVC.identifier,
                                                            for: indexPath) as? ProductCVC else {
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
