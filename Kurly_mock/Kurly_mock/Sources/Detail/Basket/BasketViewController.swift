//
//  BasketViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/23.
//

import UIKit

class BasketViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataManager: OptionDataManager = OptionDataManager()
    var productID: String?
    var options: [Option]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        dataManager.getOptions(productID: productID ?? "8", delegate: self)
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension BasketViewController {
    func getOptions(result: [Option]) {
        self.options = result
        tableView.reloadData()
    }
    
    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0,
                                                         width: tableView.frame.size.width,
                                                         height: CGFloat.leastNonzeroMagnitude))
        tableView.backgroundColor = .clear
    }
}

// MARK: - Table View Delegate
extension BasketViewController: UITableViewDelegate {
    
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

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
}

// MARK: - Table View DataSource
extension BasketViewController: UITableViewDataSource {
    
    // 섹션은 1개
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketItemTVC.identifier, for: indexPath) as! BasketItemTVC
//        cell.optionName.text = option?.optionName
//        cell.discountPrice.text = option?.discountPrice
//        cell.price.text = option?.price
        return cell
    }
}


