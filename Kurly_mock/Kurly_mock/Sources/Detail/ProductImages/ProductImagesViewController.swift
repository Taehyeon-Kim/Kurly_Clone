//
//  ProductImagesViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/23.
//

import UIKit
import Kingfisher

class ProductImagesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var image: UIButton!
    
    // MARK: - Variables
    lazy var dataManager: ProductImageDataManager = ProductImageDataManager()
    var productID: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.getImages(productID: productID!, delegate: self)
    }
}

// MARK: - Custom Function
extension ProductImagesViewController {
    func getImages(result: ProductImage) {
        let url = URL(string: result.image ?? "")
        image?.kf.setBackgroundImage(with: url, for: .normal)
    }
}
