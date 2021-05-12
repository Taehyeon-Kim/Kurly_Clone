//
//  UIFont.swift
//  Kurly_mock
//
//  Created by taehy.k on 2021/03/13.
//

import UIKit

extension UIFont {
    public enum NotoSansType: String {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
        case thin = "Thin"
        case light = "Light"
        case demilight = "DemiLight"
    }

    static func NotoSans(_ type: NotoSansType, size: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansCJKkr-\(type.rawValue)", size: size)!
    }
}

