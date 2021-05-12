//
//  DetailAddressViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/26.
//

import UIKit

protocol DetailAddressDelegate {
    func inputAddress(address: String, detailAddress: String)
}

class DetailAddressViewController: UIViewController {
    
    // MARK: - Variables
    @IBOutlet weak var zipCode: UILabel?
    @IBOutlet weak var address: UILabel?
    @IBOutlet weak var detailAddress: UITextField?
    
    var zipcode: String = ""
    var addr: String = ""
    var detailAddr: String = ""
    var delegate: DetailAddressDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // code
        zipCode?.text = zipcode
        address?.text = addr
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func completeButtonClicked(_ sender: Any) {
        guard let text = detailAddress?.text else { return }
        delegate?.inputAddress(address: self.addr, detailAddress: text)
        dismiss(animated: false, completion: nil)
    }
}
