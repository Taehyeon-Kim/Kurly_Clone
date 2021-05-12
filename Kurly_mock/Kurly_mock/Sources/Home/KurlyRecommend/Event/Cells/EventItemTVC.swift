//
//  EventItemTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/17.
//

import UIKit

class EventItemTVC: UITableViewCell {
    
    // MARK: - Variables
    static let identifier = "EventItemTVC"

    // MARK: - IBOutlets
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
