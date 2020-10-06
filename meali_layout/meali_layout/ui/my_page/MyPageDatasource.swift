//
//  MyPageDatasource.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/18.
//

import RxDataSources

enum MyPageSectionItem {
    case feedback
    case review
    case version
    case addLock
    //case healthKitsync(isOn: Bool)
    //case removeAD(price: String?)
    
    
    var title: String{
        switch self {
        case .feedback:
            return I18N.feedbackToDevelper
        case .review:
            return I18N.reviewOnAppstore
        case .version:
            return I18N.versionInfo
        case .addLock:
            return I18N.addWithLock
//        case .healthKitsync:
//            return I18N.myPagehealthKitSyncTitle
//        case .removeAD:
//            return I18N.removeAD
        }
    }
//  이미지는 나중에 넣자
//    var image: UIImage? {
//        switch self {
//        case :
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    var hasArrow: Bool{
        switch self {
        case .feedback, .review:
            return true
//        case .healthKitSync, .removeAD:
//            return true
        case .version, .addLock:
            return false
        }
    }
    var rightText: String?{
        switch self {
        case .feedback, .review, .addLock:
            return nil
//        case .healthKitSync(let isOn):
//            return isOn ? "ON" : "OFF"
//        case .removeAD(let price):
//            return price
        case .version:
            return nil
        }
    }
}
// ? 하단과 같이
class MyPageDatasource: RxCollectionViewSectionedReloadDataSource<SectionModel<Void, MyPageSectionItem>> {
    init(collectionView: UICollectionView){
        collectionView.register(cellType: MyPageBasicCell.self)
        
        super.init(configureCell: { (datasource, collectionView, indexPath, item) -> UICollectionViewCell in
            let sectionItem = datasource[indexPath]
            let cell = collectionView.dequeueReusableCell(with: MyPageBasicCell.self, for: indexPath)
            cell.bind(image: nil, title: sectionItem.title, hasArrow: sectionItem.hasArrow, rightText: sectionItem.rightText)
//            cell.bind(image: sectionItem.image, title: sectionItem.title, hasArrow: sectionItem.hasArrow, rightText: sectionItem.rightText)
            return cell
        })
    }
}
