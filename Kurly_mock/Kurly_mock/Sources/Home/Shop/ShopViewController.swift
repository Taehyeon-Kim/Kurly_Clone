//
//  ShopViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/26.
//

import UIKit
import Kingfisher

class ShopViewController: UIViewController {
    
    
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    lazy var dataManager: ShopDataManager = ShopDataManager()
    var products: [ProductsResult]?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        let url = URL(string: "https://img-cf.kurly.com/shop/data/category/pc_category_EDLP_210205.1612768855.jpg")
        banner.contentMode = .scaleToFill
        banner.kf.setImage(with: url)
        
        self.dismissKeyboard()
        dataManager.getShop(filterType: "B", mainCategoryID: "1", delegate: self)
    }
}

extension ShopViewController {
    
    // 데이터 담기
    func getShop(result: [ProductsResult]) {
        self.products = result
        collectionView.reloadData()
    }
    
    // 컬렉션 뷰 셋업
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15)
        //        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: view.bounds.width/2 - 20, height: 360)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - colletion view delegate
extension ShopViewController: UICollectionViewDelegate {}

// MARK: - colletion view data source
extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopCVC.identifier, for: indexPath) as! ShopCVC
        let product = products?[indexPath.row]
        
        let url = URL(string: product?.image ?? "")
        cell.image.contentMode = .scaleAspectFill
        cell.image.kf.setImage(with: url)
        
        cell.productName.text = product?.productName
        cell.discountRate.text = product?.discountRate
        cell.discountPrice.text = product?.discountPrice
        cell.price.text = product?.price
        cell.kurlyTag.text = product?.tag
        
        return cell
    }
}
