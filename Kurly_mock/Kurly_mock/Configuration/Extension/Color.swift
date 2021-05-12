//
//  Color.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import UIKit

extension UIColor {
    // MARK: hex code를 이용하여 정의
    // ex. UIColor(hex: 0xF5663F)
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    // MARK: 메인 테마 색 또는 자주 쓰는 색을 정의
    // ex. label.textColor = .mainOrange
    // - 58107F : splash 보라색이랑 살짝 다름
    class var mainPurple: UIColor { UIColor(hex: 0x560C7B) }
    class var lightPurple: UIColor { UIColor(hex: 0xBB7CF8) }
    class var black333: UIColor { UIColor(hex: 0x333333) }
    class var grayf4f4f4: UIColor { UIColor(hex: 0xf4f4f4) }
    class var gray999: UIColor { UIColor(hex: 0x999999) }
    class var toastBg: UIColor { UIColor(hex: 0xFAE4E3) }
    class var toastLabel: UIColor { UIColor(hex: 0xA4281B) }
    
    class var textGreen: UIColor { UIColor(hex: 0x3C832D) }
    class var textRed: UIColor { UIColor(hex: 0xA4281B) }
    
}
