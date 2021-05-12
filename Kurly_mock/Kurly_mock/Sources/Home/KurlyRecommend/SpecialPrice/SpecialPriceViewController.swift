//
//  SpecialPriceViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit
import Kingfisher

// 일일 특가
// - 2가지 상품만 보여주기 때문에
// - 스택뷰를 이용해서 빠르게 퍼블리싱
class SpecialPriceViewController: UIViewController {
    
    // MARK: - Variables
    lazy var dataManager: SpecialPriceDataManager = SpecialPriceDataManager()
    var products: [ProductsResult] = []
    
    // MARK: - IBOutlets
    
    // 첫번째 상품
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var firstProductName: UILabel!
    @IBOutlet weak var firstDiscountRate: UILabel!
    @IBOutlet weak var firstDiscountPrice: UILabel!
    @IBOutlet weak var firstPrice: UILabel!
    
    // 두번째 상품
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var secondProductName: UILabel!
    @IBOutlet weak var secondDiscountRate: UILabel!
    @IBOutlet weak var secondDiscountPrice: UILabel!
    @IBOutlet weak var secondPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // code
        
        self.dismissKeyboard()
        dataManager.getProducts(filterType: "D", mainCategoryID: "1", delegate: self)
    }
}

extension SpecialPriceViewController {
    // 데이터 담기
    func getProducts(result: [ProductsResult]) {
        self.products = result
        
        let url1 = URL(string: "https://img-cf.kurly.com/shop/data/goods/1499070733307y0.jpg")
        let url2 = URL(string: "https://img-cf.kurly.com/shop/data/goods/1607496047226y0.jpg")
        
        firstImage.kf.setImage(with: url1)
        firstProductName.text = products[0].productName
        firstDiscountRate.text = products[0].discountRate
        firstDiscountPrice.text = products[0].discountPrice
        firstPrice.text = products[0].price
        
        secondImage.kf.setImage(with: url2)
        secondProductName.text = products[1].productName
        secondDiscountRate.text = products[1].discountRate
        secondDiscountPrice.text = products[1].discountPrice
        secondPrice.text = products[1].price
    }
}
