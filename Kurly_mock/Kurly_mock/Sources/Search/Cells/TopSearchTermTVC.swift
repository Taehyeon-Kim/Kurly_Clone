//
//  TopSearchTermTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/15.
//

import UIKit

class TopSearchTermTVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.font = UIFont.NotoSans(.demilight, size: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
