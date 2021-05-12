//
//  ProfileBeforeLoginTVC.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/14.
//

import UIKit

class ProfileBeforeLoginTVC: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var signupBenefitButton: UIButton!
    @IBOutlet weak var loginOrSignupButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension ProfileBeforeLoginTVC {
    fileprivate func setupUI() {
        self.message.font = UIFont.NotoSans(.light, size: 17)
        self.signupBenefitButton.titleLabel?.font = UIFont.NotoSans(.light, size: 14)
        self.loginOrSignupButton.titleLabel?.font = UIFont.NotoSans(.bold, size: 16)
        
        self.loginOrSignupButton.layer.cornerRadius = 4
        
        self.signupBenefitButton.titleLabel?.tintColor = .gray999
        self.loginOrSignupButton.backgroundColor = .mainPurple
        self.loginOrSignupButton.titleLabel?.tintColor = .white
    }
}
