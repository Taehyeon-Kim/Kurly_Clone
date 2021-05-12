//
//  DetailViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var tapButton: [UIButton]!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var productID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buyButtonClicked(_ sender: Any) {
        let vc = UIStoryboard(name: "BasketStoryboard", bundle: nil).instantiateViewController(identifier: "BasketViewController") as! BasketViewController
        vc.productID = self.productID
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func tabButtonClicked(_ sender: UIButton) {
        print("\(sender.tag)번째 버튼 클릭")
        
        for button in tapButton {
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
//
//        UIView.animate(withDuration: 0.3, animations: {
//            self.indicatorView.frame.origin.x = self.tabBarStackView.frame.origin.x + self.indicatorView.frame.size.width * CGFloat(sender.tag - 1)
//        })
        scrollView.setContentOffset(CGPoint(x: contentOffset, y: scrollView.frame.origin.y), animated: true)
    }
}

extension DetailViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ToDetail":
            let vc = segue.destination as? ProductDetailsViewController
            vc?.productID = self.productID
        case "ToImage":
            let vc = segue.destination as? ProductImagesViewController
            vc?.productID = self.productID
        case "ToReview":
            let vc = segue.destination as? ProductReviewsViewController
            vc?.productID = self.productID
        case "ToQuestion":
            let vc = segue.destination as? ProductQuestionsViewController
            vc?.productID = self.productID
        default:
            return
        }
    }
    
    private func setupNavigationBar() {
//        navigationController?.navigationBar.tintColor = .black
//        navigationController?.navigationBar.barTintColor = .white
    }
}

