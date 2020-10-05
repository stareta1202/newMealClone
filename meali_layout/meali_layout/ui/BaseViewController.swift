//
//  BaseViewController.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/24.
//

import RxSwift
import LocalAuthentication

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
        localAutentication()

        super.viewDidLoad()
        
        view.backgroundColor = .brown
    }
    
    private func localAutentication() {
        let context = LAContext()
        var error: NSError?
        
        let alert = UIAlertController()
        let successAlert = UIAlertAction(title: "인증성공", style: .destructive, handler: nil)
        let failAlert = UIAlertAction(title: "인증실패", style: .default, handler: nil)
        
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        context.localizedCancelTitle = "Enter UserName/Password"

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {

            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

                if success {
                    DispatchQueue.main.async {
                        alert.title = "인증 성공"
                        alert.message = "인증 성공하였습니다."
                        print("인증 성공")
                        alert.addAction(successAlert)
                    }

                } else {
                    print(error?.localizedDescription ?? "Failed to authenticate")
                    alert.addAction(failAlert)
                    
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")

            // Fall back to a asking for username and password.
            // ...
        }
    }
}
