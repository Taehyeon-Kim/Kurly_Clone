//
//  EventTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/22.
//

import UIKit

class EventTVC: UITableViewCell {
    
    static let identifier = "EventTVC"

    @IBOutlet weak var eventImage: UIImageView?
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventSubTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
