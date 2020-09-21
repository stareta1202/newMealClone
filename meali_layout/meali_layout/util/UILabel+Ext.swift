//
//  UILabel+Ext.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/21.
//

import UIKit

extension UILabel {
    convenience init(type: UIFont.`Type`, size: CGFloat, weight: UIFont.Weight, color: UIColor = .black, text: String = "") {
        self.init()
        self.text = text
        font = UIFont.default(type: type, size: size, weight: weight)
        textColor = color
    }
    
    class var largeTitle1: UILabel {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 32.0)!
        label.textColor = .gray
        return label
    }
    
    class var largeTitle2: UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .regular)
        label.textColor = .gray
        return label
    }
    
    class var navTitle: UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17.0, weight: .semibold)
        label.textColor = .gray
        return label
    }
    
    class var subtitle: UILabel {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16.0)!
        label.textColor = .gray
        return label
    }
    
    class var button15: UILabel {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15.0)!
        label.textColor = .gray
        return label
    }
    
    class var body: UILabel {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15.0)!
        label.textColor = .gray
        return label
    }
    
    class var button13: UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .semibold)
        label.textColor = .gray
        
        return label
    }
    
    class var caption: UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12.0, weight: .regular)
        label.textColor = .gray
        return label
    }
    
    class var smallest: UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11.0, weight: .regular)
        label.textColor = .gray
        return label
    }
    
    func setLineHeight(lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = lineHeight
            attributeString.addAttribute(.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
            self.attributedText = attributeString
        }
    }
}
