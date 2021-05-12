//
//  CategoryViewController.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import UIKit

class CategoryViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var mainCategoryButton: [UIButton]!
    @IBOutlet var subCategoryContainer: [UIStackView]!
    
    // MARK: - Life Cycle 
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension CategoryViewController {
    @IBAction func mainCategoryButtonClicked(_ sender: UIButton) {
        
        // 태그는 스토리보드에서 설정해둔 상태
        
        for button in mainCategoryButton {
            // 클릭한 메뉴 서브메뉴 열기, 닫기
            if button.tag == sender.tag {
                
                subCategoryContainer[sender.tag].isHidden =
                    !subCategoryContainer[sender.tag].isHidden
            }
            // 나머지는 닫기
            else {
                subCategoryContainer[button.tag].isHidden = true
            }
        }
    }
}
