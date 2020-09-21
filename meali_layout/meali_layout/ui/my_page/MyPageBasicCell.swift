//
//  MyPageBasicCell.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/21.
//

import UIKit

class MyPageBasicCell: BaseCollectionViewCell {
    private let leftImageView = UIImageView()
    private let titleLabel = UILabel(type: .text, size: 16, weight: .regular)
    private let rightArrowImageView = UIImageView(image: UIImage(named: "generalArrowRightGr600"))
    private let rightLabel = UILabel(type: .text, size: 16, weight: .regular)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    private func initViews() {
        contentView.add(leftImageView) {
            $0.tintColor = .gray
            $0.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().offset(16)
                make.height.width.equalTo(24)
            }
        }
        contentView.add(titleLabel) {
            $0.textColor = .gray
            $0.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.leading.equalTo(self.leftImageView.snp.trailing).offset(8)
            }
        }
        
        contentView.add(UIStackView()) {
            $0.spacing = 16
            $0.axis = .horizontal
            $0.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.trailing.equalToSuperview().inset(12)
            }
            $0.addArranged(self.rightLabel) {
                $0.isHidden = true
                $0.textColor = .black
            }
            $0.addArranged(self.rightArrowImageView) {
                $0.isHidden = true
            }
        }
        
    }
    func bind(image: UIImage?, title: String, hasArrow: Bool, rightText: String?) {
        leftImageView.image = image
        titleLabel.text = title
        rightLabel.text = rightText
        rightArrowImageView.isHidden = !hasArrow
        rightLabel.isHidden = rightText == nil
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
