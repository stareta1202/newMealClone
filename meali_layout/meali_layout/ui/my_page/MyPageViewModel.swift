//
//  MyPageViewModel.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/23.
//

import StoreKit
import RxDataSources
import Action

typealias MyPageSectionModel = SectionModel<Void, MyPageSectionItem>
class MyPageViewModel: BaseViewModel {
    @ObservableProperty
    private(set) var data = [MyPageSectionModel]()
    
    lazy var isFeedbackClick: Bool = false
    lazy var isAddLockClicked: Bool = false
    lazy var chagneCollectionViewCellAction: CocoaAction = .create{ [weak self ] _ in self?.feedbackClicked() }
    lazy var changeCollectionViewAddLock: CocoaAction = .create { [weak self] _ in self?.addLockClicked()}
    override init() {
        super.init()
        updateData()
        
    }
    private func updateData() {
        var items = [MyPageSectionItem]()
        items.append(.feedback)
        items.append(.review)
        
        if !isFeedbackClick {
            items.append(.version)
        }
        if !isAddLockClicked {
            items.append(.addLock)
        }
        
        data = [SectionModel(model: (), items: items)]
    }
    
    private func feedbackClicked() {
        isFeedbackClick = true
        updateData()
    }
    private func addLockClicked() {
        isAddLockClicked = true
        updateData()
    }
    
}
