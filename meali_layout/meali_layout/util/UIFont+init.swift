//
//  UIFont+init.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/21.
//

import UIKit

extension UIFont {
    enum `Type` {
        case text
        case number
    }
    
    static func `default`(type: Type, size: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch type {
        case .text:
            return defaultTextFont(ofSize: size, weight: weight)
        case .number:
            return defaultNumberFont(ofSize: size, weight: weight)
        }
    }
    
    private static func defaultTextFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName: String
        switch weight {
        case .heavy, .black:
            fontName = "AppleSDGothicNeo-ExtraBold"
        case .bold:
            fontName = "AppleSDGothicNeo-Bold"
        case .semibold:
            fontName = "AppleSDGothicNeo-SemiBold"
        case .medium:
            fontName = "AppleSDGothicNeo-Medium"
        case .regular:
            fontName = "AppleSDGothicNeo-Regular"
        case .light:
            fontName = "AppleSDGothicNeo-Light"
        case .thin:
            fontName = "AppleSDGothicNeo-Thin"
        case .ultraLight:
            fontName = "AppleSDGothicNeo-UltraLight"
        default:
            fontName = ""
        }
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    private static func defaultNumberFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName: String
        switch weight {
        case .black:
            fontName = "Avenir-Black"
        case .heavy:
            fontName = "Avenir-Heavy"
        case .bold, .semibold:
            fontName = "Avenir-Medium"
        case .medium, .regular, .light, .thin, .ultraLight:
            fontName = "Avenir-Roman"
        default:
            fontName = ""
        }
        return UIFont(name: fontName, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
}
