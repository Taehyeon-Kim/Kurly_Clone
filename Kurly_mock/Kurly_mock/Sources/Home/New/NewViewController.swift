//
//  NewViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/25.
//

import UIKit
import Kingfisher

class NewViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    lazy var dataManager: NewDataManager = NewDataManager()
    var products: [ProductsResult]?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        self.dismissKeyboard()
        dataManager.getNewProducts(filterType: "B", mainCategoryID: "1", delegate: self)
    }
}

extension NewViewController {
    
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
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15)
//        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: view.bounds.width/2 - 20, height: 360)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - colletion view delegate
extension NewViewController: UICollectionViewDelegate {}

// MARK: - colletion view data source
extension NewViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCVC.identifier, for: indexPath) as! NewCVC
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
