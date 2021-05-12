//
//  ProductReviewsViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/21.
//

/*
 - 버튼
 - 테이블뷰
 */

import UIKit

class ProductReviewsViewController: UIViewController {
    
    // MARK: - Life Cycle
    @IBOutlet weak var writeReviewButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    lazy var dataManager: ReviewDataManager = ReviewDataManager()
    var reviews: [Review]? = []
    var productID: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // code
        dataManager.getReviews(productID: productID!, delegate: self)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
}

extension ProductReviewsViewController {
    func getReviews(result: [Review]) {
        self.reviews = result
        tableView.reloadData()
    }
}

extension ProductReviewsViewController {
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0,
                                                         width: tableView.frame.size.width,
                                                         height: CGFloat.leastNonzeroMagnitude))
        tableView.backgroundColor = .clear
        // 셀 등록
        // XIB 파일로 만들지 않았기 때문에, 새로 셀을 등록하면 충돌이 발생한다!
        // tableView.register(UINib(nibName: ReviewTVC.identifier, bundle: nil), forCellReuseIdentifier: ReviewTVC.identifier)
    }
}

// MARK: - Table View Delegate
extension ProductReviewsViewController: UITableViewDelegate {
    
    // 아래와 같은 방식으로 헤더와 푸터에 여백 생기는 문제 제거
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }

}

// MARK: - Table View DataSource
extension ProductReviewsViewController: UITableViewDataSource {
    
    // 섹션은 1개
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 후기는 5개로 고정 + 나머지 1개는 전체보기 버튼
        return (reviews?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 셀 2개 밖에 없기 때문에, if ~ else로 처리
        if indexPath.row == reviews?.count ?? 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewAllTVC.identifier, for: indexPath) as? ViewAllTVC else {
                return UITableViewCell()
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WriteContentsTVC.identifier, for: indexPath) as? WriteContentsTVC else {
                return UITableViewCell()
            }
            
            let reviews = self.reviews?[indexPath.row]
            cell.reviewTitle.text = reviews?.reviewTitle
            cell.writer.text = reviews?.writer
            cell.date.text = reviews?.date
            
            return cell
        }
    }
}
