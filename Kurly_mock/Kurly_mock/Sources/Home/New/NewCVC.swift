//
//  NewCVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/25.
//

import UIKit

class NewCVC: UICollectionViewCell {
    static let identifier = "NewCVC"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var kurlyTag: UILabel!
}
