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
    var localAuth = LocalAuthenticationView()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        modalPresentationStyle = .pageSheet
 
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundlerOrNile: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundlerOrNile)
        
        modalPresentationStyle = .pageSheet
    }
    override func viewWillAppear(_ animated: Bool) {
        //localAutentication()
    }
    
    override func viewDidLoad() {
        //localAutentication()
        //localAuth.authenticationWithTouchID()
        //super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
    }
    
    private func localAutentication() {
        let context = LAContext()
        var error: NSError?
        
        let alert = UIAlertController(title: "인증 여부?", message: "당신의 인증여부를 판단합니다", preferredStyle: .alert)
        let successAlert = UIAlertAction(title: "인증성공", style: .default, handler: nil)
        let failAlert = UIAlertAction(title: "인증실패", style: .destructive, handler: nil)
        
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        context.localizedCancelTitle = "Enter UserName/Password"

        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {

            let reason = "Log in to your account"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

                if success {
                    DispatchQueue.main.async {
                        print("인증 성공")
                        alert.addAction(successAlert)
                        self.present(alert, animated: true, completion: nil)
                        //super.viewDidLoad()
                    }

                } else {
                    print(error?.localizedDescription ?? "Failed to authenticate")
                    
                }
            }
        } else {
            print(error?.localizedDescription ?? "Can't evaluate policy")

            // Fall back to a asking for username and password.
            // ...
        }
    }
}
