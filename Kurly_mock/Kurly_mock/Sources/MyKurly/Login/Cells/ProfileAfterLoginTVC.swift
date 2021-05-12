//
//  ProfileAfterLoginTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/17.
//

import UIKit

class ProfileAfterLoginTVC: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var membershipLevelName: UILabel!
    @IBOutlet weak var pointRate: UILabel!
    
    // MARK: - variables
    static let identifier = "ProfileAfterLoginTVC"

    var userID: Int?
    var jwt: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func settingData(name: String?, level: String?, point: String?) {
        self.name.text = name
        self.membershipLevelName.text = level
        self.pointRate.text = point
    }
}
