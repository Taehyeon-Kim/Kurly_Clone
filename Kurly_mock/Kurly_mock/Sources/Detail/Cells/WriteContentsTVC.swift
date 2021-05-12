//
//  ReviewTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/21.
//

/*
 후기 셀
 - 제목
 - (등급) - 작성자
 - 날짜 - (이미지)
 */

import UIKit

class WriteContentsTVC: UITableViewCell {
    
    // MARK: - Variables
    // identifier
    static let identifier = "WriteContentsTVC"

    @IBOutlet weak var reviewTitle: UILabel!
    @IBOutlet weak var writer: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
