//
//  ProductsCVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/17.
//

import UIKit

protocol ProductsCVCDelegate {
    func cellSelectedAtIndexPath(indexPath: Int)
}

class ProductsCVC: UICollectionViewCell {
    
    static let identifier = "ProductsCVC"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
