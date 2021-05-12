//
//  ProductQuestionsViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit

class ProductQuestionsViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    lazy var dataManager: QuestionDataManager = QuestionDataManager()
    var questions: [Question]? = []
    var productID: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // code
        dataManager.getQuestions(productID: productID!, delegate: self)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}

extension ProductQuestionsViewController {
    func getQuestions(result: [Question]) {
        self.questions = result
        tableView.reloadData()
    }
    
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
extension ProductQuestionsViewController: UITableViewDelegate {
    
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
extension ProductQuestionsViewController: UITableViewDataSource {
    
    // 섹션은 1개
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 후기는 5개로 고정 + 나머지 1개는 전체보기 버튼
        return (questions?.count ?? 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 셀 2개 밖에 없기 때문에, if ~ else로 처리
        if indexPath.row == questions?.count ?? 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewAllTVC.identifier, for: indexPath) as? ViewAllTVC else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WriteContentsTVC.identifier, for: indexPath) as? WriteContentsTVC else {
                return UITableViewCell()
            }
            
            let questions = self.questions?[indexPath.row]
            cell.reviewTitle.text = questions?.questionTitle
            cell.writer.text = questions?.writer
            cell.date.text = questions?.date
            return cell
        }
    }
}


