//
//  PopUpViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/25.
//

import UIKit
import WebKit

class PopUpViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Life Cycle   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 닫기 버튼 연결
        closeButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }

}

extension PopUpViewController {
    @objc func dismissView() {
        dismiss(animated: false, completion: nil)
    }
}



