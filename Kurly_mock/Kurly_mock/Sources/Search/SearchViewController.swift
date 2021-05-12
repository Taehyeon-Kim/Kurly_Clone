//
//  SearchViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import UIKit

class SearchViewController: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Varibles
    let headerTitle = ["인기 검색어", "최근 검색어", "상품 바로가기"]
    var currentDummy: [String] = []
    let topSearchTermDummy: [String] = [
        "한우 국거리",
        "파스타",
        "새우살",
        "스테이크",
        "바지락",
        "사탕"
    ]
    let recentSearchTermDummy: [String] = [
        "최근 검색어가 없습니다."
    ]
    let productTermDummy: [String] = []
    
    var searchFlag: Int = 0 {
        didSet {
            if searchFlag == 0 {
                print("인기 검색어 // 서치바 눌림")
            } else if searchFlag == 1 {
                print("최근 검색어 // 서치바 안눌림 + 취소버튼 눌림")
            } else if searchFlag == 2 {
                print("상품 바로가기 // 검색 시작")
            }
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentDummy = topSearchTermDummy
    }
}

// MARK: - 익스텐션(extentions)
extension SearchViewController {
    
    // 서치바 셋업
    fileprivate func setupSearchBar() {
        // 서치바 delegate
        self.searchBar.delegate = self
        // 배경 없애기 위해서
        self.searchBar.backgroundImage = UIImage()
        
        // 좌/우 inset만 적용됨
        self.searchBar.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 35, leading: 20, bottom: 25, trailing: 20)
        
        // place holder
        self.searchBar.placeholder = "검색어를 입력해 주세요"
        
        // 취소 버튼 텍스트 변경 (default: cancel)
        self.searchBar.setValue("취소", forKey: "cancelButtonText")

        // 취소 버튼 속성 변경 (색깔, 폰트)
        let cancelButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.NotoSans(.light, size: 15)
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
    }
    
    // 테이블뷰 셋업
    fileprivate func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - table view delegate
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 8, width: 320, height: 20)
        
        myLabel.font = UIFont.NotoSans(.medium, size: 12)
        myLabel.textColor = .gray999

        myLabel.text = headerTitle[searchFlag]

        let headerView = UIView()
        headerView.addSubview(myLabel)

        return headerView
    }
}

// MARK: - table view datasource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let topSearchTermTVC = tableView.dequeueReusableCell(withIdentifier: "TopSearchTermTVC") as? TopSearchTermTVC else {
            return UITableViewCell()
        }

        topSearchTermTVC.textLabel?.text = currentDummy[indexPath.row]

        if searchFlag == 0 {
            topSearchTermTVC.textLabel?.textColor = .mainPurple
        } else {
            topSearchTermTVC.textLabel?.textColor = .gray999
        }
        return topSearchTermTVC
    }
}

// MARK: - search bar delegate
extension SearchViewController: UISearchBarDelegate {
    // 검색 창 클릭 시
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
        
        self.searchFlag = 1
        
        // 데이터 변경 - 최근 검색어
        currentDummy = recentSearchTermDummy
        tableView.reloadData()
    }
    
    // 취소버튼 클릭 시 키보드 내리기, 검색어 초기화, 검색바 늘리기
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
        
        self.searchFlag = 0
        
        // 데이터 원상 복귀 - 인기 검색어
        currentDummy = topSearchTermDummy
        tableView.reloadData()
    }
    
    // 텍스트 업데이트 시
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("검색어 업데이트 - 현재 플래그\(searchFlag)")
        
        self.searchFlag = 2
        
        currentDummy = productTermDummy
        tableView.reloadData()
    }
}
