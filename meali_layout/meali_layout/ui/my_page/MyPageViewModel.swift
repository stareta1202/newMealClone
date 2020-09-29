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
    lazy var chagneCollectionViewCellAction: CocoaAction = .create{ [weak self ] _ in self?.changeCollectionView() }
    
    
    
    override init() {
        super.init()
        updateData()
        
    }
    private func updateData() {
        var items = [MyPageSectionItem]()
        items.append(.feedback)
        items.append(.review)
        items.append(.version)
        
        if isFeedbackClick == true {
            items.remove(at: items.count - 1)
        }
        
        data = [SectionModel(model: (), items: items)]
    }
    
    private func changeCollectionView() {
        isFeedbackClick = true
        updateData()
    }
    
}
