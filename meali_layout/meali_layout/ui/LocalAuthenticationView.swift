//
//  LocalAuthenticationView.swift
//  meali_layout
//
//  Created by 이용준 on 2020/10/05.
//

import LocalAuthentication
import UIKit

class LocalAuthenticationView: UIViewController {
    var context = LAContext()
    
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    var state = AuthenticationState.loggedin {
        didSet {
        }
    }
    
}
