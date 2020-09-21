//
//  UIView+add.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/21.
//
import UIKit

extension UIView {
    @discardableResult
    func add<T: UIView>(_ subview: T, then closure: ((T) -> Void)? = nil) -> T {
        addSubview(subview)
        closure?(subview)
        return subview
    }
    
    @discardableResult
    func adds<T: UIView>(_ subviews: [T], then closure: (([T]) -> Void)? = nil) -> [T] {
        subviews.forEach { addSubview($0) }
        closure?(subviews)
        return subviews
    }
}

extension UIStackView {
    @discardableResult
    func addArranged<T: UIView>(_ subview: T, then closure: ((T) -> Void)? = nil) -> T {
        addArrangedSubview(subview)
        closure?(subview)
        return subview
    }
    
    @discardableResult
    func addArranged<T: UIView>(_ subview: T, spacing: CGFloat, then closure: ((T) -> Void)? = nil) -> T {
        addArrangedSubview(subview)
        setCustomSpacing(spacing, after: subview)
        closure?(subview)
        return subview
    }
}
