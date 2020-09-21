//
//  MyPageViewController.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/18.
//


import UIKit
import SnapKit


class MyPageViewController: UIViewController {
    
    private let navigationBar = NavigationBar()
    private let collectionView: UICollectionView = .collectionView()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        view.add(navigationBar) {
            $0.setLeftBarButtonItems([NavigationBarItem(text: I18N.myPageTitle)])
            $0.snp.makeConstraints {
                $0.top.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(NavigationBar.defaultHeight)
            }
        }
        view.add(collectionView) {
            $0.delegate = self
            $0.snp.makeConstraints {
                $0.leading.trailing.equalToSuperview()
                $0.top.equalTo(self.navigationBar.snp.bottom)
                $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let collectionViewHeight = collectionView.frame.height
        let contentHeight = collectionView.contentSize.height
        
        let centeringI
    }
}

extension MyPageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch datasource[indexPath]
        
    }
}
extension MyPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 64)
    }
}

private extension UIView {
    static func collectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .red
        return collectionView
    }
}
