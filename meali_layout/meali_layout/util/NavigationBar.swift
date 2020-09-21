//
//  NavigationBar.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/18.
//
import UIKit

class NavigationBar: UIView {
    static let defaultHeight = CGFloat(44)
    
    private let containerView = UIView()
    private let leftStackView: UIStackView = .defaultStackView()
    private let rightStackView: UIStackView = .defaultStackView()
    let title: UILabel = .navTitle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
        backgroundColor = .black
        
        add(containerView) {
            $0.backgroundColor = .clear
            $0.snp.makeConstraints {
                $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
                $0.leading.trailing.bottom.equalToSuperview()
            }
        }
        
        containerView.adds([leftStackView, rightStackView, title])
        
        leftStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(4)
            $0.bottom.equalToSuperview()
        }
        
        rightStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-8)
            $0.top.equalToSuperview().offset(4)
            $0.bottom.equalToSuperview()
        }
        
        title.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func setLeftBarButtonItems(_ items: [NavigationBarItem]) {
        leftStackView.subviews.forEach { $0.removeFromSuperview() }
        items.map { $0.asView() }.forEach { leftStackView.addArrangedSubview($0) }
    }
    
    func setRightBarButtonItems(_ items: [NavigationBarItem ]) {
        rightStackView.subviews.forEach { $0.removeFromSuperview() }
        items.reversed().map { $0.asView() }.forEach { rightStackView.addArrangedSubview($0) }
    }
    
    func setTitle(_ title: String?) {
        self.title.text = title
    }
    
    func clearAllItems() {
        leftStackView.subviews.forEach { $0.removeFromSuperview() }
        rightStackView.subviews.forEach { $0.removeFromSuperview() }
        title.text = nil
    }
}

class NavigationBarItem {
    private var containerView: UIView
    
    private let titleLabel = UILabel(type: .text, size: 17, weight: .semibold, color: .blue)
    
    init(text: String) {
        titleLabel.text = text
        titleLabel.sizeToFit()
        titleLabel.textAlignment = .center
        let width = titleLabel.frame.width
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(40).priority(.high)
        }
        containerView = titleLabel
    }
    
    init(image: UIImage) {
        let imageView = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
        imageView.contentMode = .center
        imageView.tintColor = .gray
        imageView.snp.makeConstraints {
            $0.width.equalTo(image.size.width + 16)
            $0.height.equalTo(40).priority(.high)
        }
        containerView = imageView
    }
    
    init(customButton: UIButton) {
        customButton.sizeToFit()
        customButton.snp.makeConstraints {
            $0.width.equalTo(40)
            $0.height.equalTo(40).priority(.high)
        }
        containerView = customButton
    }
    
    init(customView: UIView) {
        containerView = customView
    }
    
    convenience init(customImage: UIImage?, target: Any, action: Selector) {
        let originalRenderMode = customImage?.renderingMode ?? .alwaysTemplate
        let button = UIButton()
        button.tintColor = .gray
        button.setImage(customImage?.withRenderingMode(originalRenderMode == .automatic ? .alwaysTemplate : originalRenderMode), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        self.init(customButton: button)
    }
        
    func asView() -> UIView {
        return containerView
    }
    
    func setTitle(text: String) {
        titleLabel.text = text
        containerView = titleLabel
        titleLabel.sizeToFit()
        containerView.layoutIfNeeded()
    }
}

private extension UIView {
    static func defaultStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.addArranged(UIView()) {
            $0.snp.makeConstraints { (make) in
                make.width.equalTo(0)
            }
        }
        return stackView
    }
}
