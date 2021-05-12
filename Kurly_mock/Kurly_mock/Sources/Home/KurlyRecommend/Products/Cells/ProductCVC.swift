//
//  ProductCVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit

class ProductCVC: UICollectionViewCell {
    static let identifier = "ProductCVC"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    
}
