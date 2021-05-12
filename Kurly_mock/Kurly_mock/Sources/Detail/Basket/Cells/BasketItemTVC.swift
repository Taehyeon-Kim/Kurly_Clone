//
//  ItemTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/23.
//

import UIKit

/*
 "{
     ""isSuccess"": true,
     ""code"": 1000,
     ""message"": ""성공"",
     ""result"": [
         {
             ""optionID"": 1,
             ""optionName"": ""(품절)[심플잇] 오트면 충분해 그레인 50g"",
             ""discountPrice"": null,
             ""price"": ""1500원""
         },
         {
             ""optionID"": 2,
             ""optionName"": ""[심플잇] 오트면 충분해 레드빈 50g"",
             ""discountPrice"": null,
             ""price"": ""1500원""
         }
     ]
 }"
 */

class BasketItemTVC: UITableViewCell {
    
    static let identifier = "BasketItemTVC"

    
    @IBOutlet weak var optionName: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
