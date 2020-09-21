//
//  ClassNameProtocol.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/21.
//

import UIKit

protocol ClassNameProtocol {
    static var className: String { get }
    
    var className: String { get }
}

extension ClassNameProtocol {
    static var className: String {
        return "\(self)"
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol{}
