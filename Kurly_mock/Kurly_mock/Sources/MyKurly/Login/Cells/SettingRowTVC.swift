//
//  SettingRowTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/14.
//

import UIKit

class SettingRowTVC: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var contentLabel: UILabel!
    
    static let identifier = "SettingRowTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func setupUI() {
        self.contentLabel.font = UIFont.NotoSans(.light, size: 16)
    }
}
