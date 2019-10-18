//
//  LoginViewModel.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    
    static let sharedInstance = LoginViewModel()
    
    func checkLoginValidation(username: String, password: String) -> Bool {
        
        if username.count > 0 {
            if password.count > 0 {
                    return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
}
