//
//  HomeViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var tabButton: [UIButton]!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var indicator: UIView!
    @IBOutlet weak var tabBarStackView: UIStackView!
    
    // MARK: - Variables
    lazy var dataManager: ProductsDatamanager = ProductsDatamanager()
    var products: [ProductsResult] = []
    
    // Indicator로 현재 페이지 표시 UIView
    // 색상은 자유롭게 표시해주세요.
    var indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = .mainPurple
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    var indicatorLeadingConstaraint: NSLayoutConstraint!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 네비게이션 바 세팅
        setupNavigationBar()
        setConstraint()
        
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabButton[0].isSelected = true
        setupNavigationBar()
    }
    
    @IBAction func tabButtonClicked(_ sender: UIButton) {
        print("\(sender.tag)번째 버튼 클릭")
        
        for button in tabButton {
            // 클릭한 메뉴 서브메뉴 열기, 닫기
            if button.tag == sender.tag {
                button.isSelected = true
            }
            // 나머지는 닫기
            else {
                button.isSelected = false
            }
        }
        
        let contentOffset = self.view.bounds.size.width * CGFloat(sender.tag - 1)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.indicatorView.frame.origin.x = self.tabBarStackView.frame.origin.x + self.indicatorView.frame.size.width * CGFloat(sender.tag - 1)
        })
        scrollView.setContentOffset(CGPoint(x: contentOffset, y: scrollView.frame.origin.y), animated: true)
    }
}

extension HomeViewController {
    // MARK: - Custom Function (UI)
    
    // IndictorView의 왼쪽 오토레이아웃 조정을 통한 이동을 해줄 것이기 때문에 다음과 같이 합니다.
    private func setConstraint() {
        
        self.view.addSubview(indicatorView)
        
        indicatorLeadingConstaraint = indicatorView.leadingAnchor.constraint(equalTo: tabBarStackView.leadingAnchor)
        NSLayoutConstraint.activate([
            indicatorView.topAnchor.constraint(equalTo: tabBarStackView.bottomAnchor),
            indicatorView.widthAnchor.constraint(equalToConstant: tabBarStackView.frame.width / 5),
            indicatorView.bottomAnchor.constraint(equalTo: scrollView.topAnchor),
            indicatorLeadingConstaraint,
            indicatorView.heightAnchor.constraint(equalToConstant: 3),
        ])
    }
    
    fileprivate func setupNavigationBar() {
        // 네비게이션 타이틀 이미지 설정
        if let logo = UIImage(named: "logo_type2_x2") {
            let imageView = UIImageView(image: logo)
            imageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            self.navigationItem.titleView = imageView
        } else{
            print("타이틀 로고 이미지를 찾을 수 없습니다.")
        }
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let pos = scrollView.contentOffset.x
        print(pos)
    }
}
