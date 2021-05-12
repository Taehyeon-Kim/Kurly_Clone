//
//  LocationViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/25.
//

import UIKit

class LocationViewController: UIViewController {

    
    // MARK: - IBOutlets
    @IBOutlet weak var baseAddress: UILabel?
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.baseAddress?.text = address
        
        self.title = "배송지"

        // - 반투명 속성 제거
        self.navigationController?.navigationBar.isTranslucent = false
        
        // - 탭 바 색상: 흰색
        self.navigationController?.navigationBar.barTintColor = .white
        
        // - 뒤로 가기 버튼: 검정색
        self.navigationController?.navigationBar.tintColor = .black
        
        // - 타이틀 색상 및 폰트 조절
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            
            // 안 써주면 attributes가 다시 적용되기 때문에 폰트 반영이 안 된다. (참고!)
            .font : UIFont.NotoSans(.regular, size: 16)
        ]
    }

}
