//
//  EventViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit

// 이벤트 뷰

class EventViewController: UIViewController {
    
    // MARK: - Variables
    lazy var dataManager: EventDataManager = EventDataManager()
    var events: [Event]?

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // code
        self.dismissKeyboard()
        dataManager.getEventsData(delegate: self)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
}

extension EventViewController {
    // 이벤트 받아오기
    func getEvents(result: [Event]) {
        self.events = result
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: EventItemTVC.identifier, bundle: nil), forCellReuseIdentifier: EventItemTVC.identifier)
        
        tableView.backgroundColor = .clear
        self.tableView.tableFooterView = UIView()
    }
}

extension EventViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.section)번째 섹션 - \(indexPath.row)번째 행")
    }
    
    
    // 각 셀을 섹션으로 구분해서 간격 부여하려고
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    // 헤더 섹션마다 회색 줄 있는 거 제거하려고
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension EventViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventItemTVC.identifier, for: indexPath) as? EventItemTVC else {
            return UITableViewCell()
        }
        
        let event = self.events?[indexPath.section]
        
        if let eventTitle = event?.eventTitle {
            cell.title.text = eventTitle
        }
        
        if let eventSubTitle = event?.eventSubTitle {
            cell.subTitle.text = eventSubTitle
        }

        cell.backgroundColor = .clear
        return cell
    }
}
