//
//  EventContainerTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/17.
//

import UIKit

class EventContainerTVC: UITableViewCell {
    
    static let identifier = "EventContainerTVC"

    @IBOutlet weak var tableView: UITableView!
    let footerView = UIView()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension EventContainerTVC {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: EventItemTVC.identifier, bundle: nil), forCellReuseIdentifier: EventItemTVC.identifier)
        tableView.backgroundColor = .systemGray5
        footerView.frame.size.height = 1
        self.tableView.tableFooterView = footerView
    }
}

extension EventContainerTVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}
extension EventContainerTVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventItemTVC.identifier, for: indexPath) as? EventItemTVC else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = .clear
        
        return cell
    }
}
