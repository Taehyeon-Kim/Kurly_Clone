//
//  MyKurlyViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import UIKit

class MyKurlyViewController: BaseViewController {
    
    // MARK: - Variables
    let dataManager: ProfileDataManager = ProfileDataManager()
    var loginState: Bool = false
    var userID: Int = 0
    var jwt: String = ""
    var profile: Profile?
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Views

    let footerView = UIView()
    let commonSectionContents = [
        ["비회원 주문 조회"],
        ["배송 안내","공지사항","자주하는 질문","고객센터","이용안내","컬리소개"],
        ["알림 설정"]
    ]
    
    let afterSectionContents = [
        ["적립금","쿠폰","친구초대"],
        ["주문 내역","배송지 관리","상품 후기","상품 문의","1:1 문의","대량주문 문의"],
        ["배송 안내","공지사항","자주하는 질문","고객센터","이용안내","컬리소개","컬리패스"],
        ["개인정보 수정","알림 설정"],
        ["로그아웃"]
    ]
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Custon Function + IBAction
    
    @objc func loginButtonClicked(_ sender: Any) {
        // 로그인 창으로 이동
        let loginViewController = UIStoryboard(name: "LoginStoryboard", bundle: nil).instantiateViewController(identifier: "LoginNavigationController") as! UINavigationController
        
        // 델리게이트 선언 문제 해결
        // - 위에서 네비게이션 컨트롤러로 타입캐스팅 후에
        // - 자식 뷰 컨트롤러를 topViewController로 불러와야 함
        let vc = loginViewController.topViewController as! LoginViewController
        vc.delegate = self
        
        loginViewController.modalPresentationStyle = .overFullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
}

// MARK: - 테이블 뷰 익스텐션
extension MyKurlyViewController {
    
    func setProfile(result: Profile) {
        self.profile = result
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ProfileBeforeLoginTVC", bundle: nil),
                           forCellReuseIdentifier: "ProfileBeforeLoginTVC")
        tableView.register(UINib(nibName: ProfileAfterLoginTVC.identifier, bundle: nil),
                           forCellReuseIdentifier: ProfileAfterLoginTVC.identifier)
        tableView.register(UINib(nibName: "SettingRowTVC", bundle: nil),
                           forCellReuseIdentifier: "SettingRowTVC")
        tableView.register(UINib(nibName: SmallBannerTVC.identifier, bundle: nil),
                           forCellReuseIdentifier: SmallBannerTVC.identifier)
        
        tableView.backgroundColor = .systemGray5
        
        footerView.frame.size.height = 1
        tableView.tableFooterView = footerView
    }
}

// MARK: - 테이블 뷰 delegate
extension MyKurlyViewController: UITableViewDelegate {
    
    // 셀 당 고정 높이 부여
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 223
        } else {
            return 50
        }
    }
    
    // 섹션 간격을 헤더 높이로 부여
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        // 첫 번째 섹션은 위에 붙어야 하니까 0 부여
        if section == 0 {
            return 0
        }
        return 10
    }
    
}

// MARK: - 테이블 뷰 datasource
extension MyKurlyViewController: UITableViewDataSource {
    
    // 섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        if loginState {
            return afterSectionContents.count + 2
        } else {
            return commonSectionContents.count + 1
        }
    }
    
    // 테이블 뷰 섹션 당 행 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if loginState {
            switch section {
            case 0:
                return 1
            // 배너
            case 1:
                return 1
            case 2:
                return afterSectionContents[0].count
            case 3:
                return afterSectionContents[1].count
            case 4:
                return afterSectionContents[2].count
            case 5:
                return afterSectionContents[3].count
            case 6:
                return afterSectionContents[4].count
            default:
                return 0
            }
        } else {
            switch section {
            case 0:
                return 1
            case 1:
                return commonSectionContents[0].count
            case 2:
                return commonSectionContents[1].count
            case 3:
                return commonSectionContents[2].count
            default:
                return 0
            }
        }
        
    }
    
    // 테이블 뷰 셀 가져오기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            if loginState {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileAfterLoginTVC.identifier) as? ProfileAfterLoginTVC else { return UITableViewCell() }
                
                cell.name.text = profile?.name
                cell.membershipLevelName.text = profile?.membershipLevelName
                cell.pointRate.text = profile?.pointRate
                
                return cell
            } else {
                guard let profileBeforeLoginTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileBeforeLoginTVC") as? ProfileBeforeLoginTVC else { return UITableViewCell() }
                
                profileBeforeLoginTVC.loginOrSignupButton.addTarget(self, action: #selector(loginButtonClicked(_:)), for: .touchUpInside)
                
                return profileBeforeLoginTVC
            }

            
        } else {
            
            guard let settingRowTVC = tableView.dequeueReusableCell(withIdentifier: "SettingRowTVC") as? SettingRowTVC else { return UITableViewCell() }
            
            if loginState {
                let contents = self.afterSectionContents
                
                if indexPath.section == 2 {
                    settingRowTVC.contentLabel.text = contents[indexPath.section - 2][indexPath.row]
                } else if indexPath.section == 3 {
                    settingRowTVC.contentLabel.text = contents[indexPath.section - 2][indexPath.row]
                } else if indexPath.section == 4 {
                    settingRowTVC.contentLabel.text = contents[indexPath.section - 2][indexPath.row]
                } else if indexPath.section == 5 {
                    settingRowTVC.contentLabel.text = contents[indexPath.section - 2][indexPath.row]
                } else if indexPath.section == 6 {
                    settingRowTVC.contentLabel.text = contents[indexPath.section - 2][indexPath.row]
                }
                
                return settingRowTVC
                
            } else {
                let contents = self.commonSectionContents
                
                if indexPath.section == 1 {
                    settingRowTVC.contentLabel.text = contents[indexPath.section - 1][indexPath.row]
                } else if indexPath.section == 2 {
                    settingRowTVC.contentLabel.text = contents[indexPath.section - 1][indexPath.row]
                } else if indexPath.section == 3 {
                    settingRowTVC.contentLabel.text = contents[indexPath.section - 1][indexPath.row]
                }
                
                return settingRowTVC
            }
                        
        }

    }
    
}

extension MyKurlyViewController: LoginDelegate {
    func modalDidFinished(loginState: Bool, userID: Int, jwt: String) {
        self.loginState = loginState
        self.userID = userID
        self.jwt = jwt
        tableView.reloadData()
        
        dataManager.getProfile(userID: self.userID , jwt: self.jwt , delegate: self)
        
        print("로그인 상태 : \(loginState)")
        print("델리게이트 실행")
    }
}
