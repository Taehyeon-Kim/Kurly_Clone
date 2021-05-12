//
//  BaseViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import UIKit

class BaseViewController: UIViewController {
     
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        // 네비게이션 바 (Navigation bar)
        setupNavigationBar()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    @IBAction func locationButtonClicked(_ sender: Any) {
        let nextVC = UIStoryboard(name: "KakaoZipCodeStoryboard", bundle: nil).instantiateViewController(identifier: "KakaoZipCodeNavigationController")
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    // MARK: - Custom Function (UI)
    
    fileprivate func setupNavigationBar() {
        
        // - 상태바
        self.navigationController?.navigationBar.barStyle = .black
        
        // - 색상
        self.navigationController?.navigationBar.barTintColor = .mainPurple
        
        // - 폰트
        self.navigationController?.navigationBar.titleTextAttributes = [
            .font : UIFont.NotoSans(.medium, size: 16)
        ]
        
        // - 반투명으로 되는 속성 제거
        self.navigationController?.navigationBar.isTranslucent = false
        
        // - 바 배경색이 보라색일때만, 타이틀 흰색 적용
        if navigationController?.navigationBar.barTintColor == UIColor.mainPurple {
            self.navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                
                // 안 써주면 attributes가 다시 적용되기 때문에 폰트 반영이 안 된다. (참고!)
                .font : UIFont.NotoSans(.bold, size: 16)
            ]
        } 
    }
    
    fileprivate func setupTabBar() {        
        // - 반투명 속성 제거
        self.tabBarController?.tabBar.isTranslucent = false
        
        // - 탭 바 색상: 흰색
        self.tabBarController?.tabBar.barTintColor = .white
        
        // - 폰트 선택 시 색상: 보라
        self.tabBarController?.tabBar.tintColor = .mainPurple
        
        // - 폰트 기본 색상: 검정
        self.tabBarController?.tabBar.unselectedItemTintColor = .black333
    }
    
}
