//
//  ProductDetailsViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/23.
//

import UIKit
import Kingfisher

class ProductDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var shortInfo: UILabel!
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var membershipLevel: UILabel!
    @IBOutlet weak var point: UILabel!
    
    @IBOutlet weak var salesUnit: UILabel!
    @IBOutlet weak var servingSize: UILabel!
    @IBOutlet weak var deliveryType: UILabel!
    @IBOutlet weak var packageType: UILabel!
    @IBOutlet weak var packageExtraInfo: UILabel!
    @IBOutlet weak var allergyInfo: UILabel!
    @IBOutlet weak var expirationDate: UILabel!
    
    @IBOutlet weak var contents: UILabel!
    
    // MARK: - Variables
    lazy var dataManager: ProductDetailsDataManager = ProductDetailsDataManager()
    var productID: String? = ""

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("🚨 Product Details View Controller - product ID : \(productID)")
        
        dataManager.getProducts(userID: "1", productID: productID!, delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension ProductDetailsViewController {
    @IBAction func orderButtonClicked(_ sender: Any) {
        let basketVC = UIStoryboard(name: "BasketStoryboard", bundle: nil)
            .instantiateViewController(identifier: "BasketViewController")
        self.present(basketVC, animated: true, completion: nil)
    }
}

extension ProductDetailsViewController {
    func getProductDetails(result: ProductDetailsResult) {
        let result = result
        
        let imageUrl = result.images!
        let urlArr = imageUrl.components(separatedBy: ",")

        let url = URL(string: urlArr[0])
        image.kf.setImage(with: url)
        productName.text = result.productName
        shortInfo.text = result.shortInfo
        discountPrice.text = result.discountPrice
        discountRate.text = result.discountRate
        price.text = result.price
        membershipLevel.text = result.membershipLevel
        point.text = result.point
        
        salesUnit.text = result.salesUnit
        servingSize.text = result.servingSize
        deliveryType.text = result.deliveryType
        
        switch result.packageType {
        case "A":
            packageType.text = "냉장/종이포장"
        case "B":
            packageType.text = "냉동/종이포장"
        case "C":
            packageType.text = "상온/종이포장"
        default:
            return
        }
        
        packageExtraInfo.text = result.packageExtraInfo
        
        allergyInfo.text = result.allergyInfo
        
        if result.expirationDate == nil {
            expirationDate.text = "없음"
        } else {
            expirationDate.text = result.expirationDate
        }
        
    }
}

