//
//  BaseViewController.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/24.
//

import RxSwift

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        modalPresentationStyle = .pageSheet
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundlerOrNile: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundlerOrNile)
        
        modalPresentationStyle = .pageSheet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
    }
}
