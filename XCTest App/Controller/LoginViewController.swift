//
//  LoginViewController.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func loginTapped(_ sender: UIButton) {
        
        if loginModel.checkLoginValidation(username: userNameTextField.text ?? "", password: passwordTextField.text ?? "") {
            performSegue(withIdentifier: "Tabs", sender: nil)
        }
        else
        {
            showFailiurAlert()
        }
    }
    
    func showFailiurAlert() {
        let alert = UIAlertController(title: "Alert", message: "Login Failed", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}

