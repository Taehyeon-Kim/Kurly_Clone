//
//  MDCVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/26.
//

import UIKit

class MDCVC: UICollectionViewCell {
    static let identifier = "MDCVC"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var discountRate: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var price: UILabel!
}
