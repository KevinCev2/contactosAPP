//
//  loginViewController.swift
//  rutas
//
//  Created by user177575 on 1/25/21.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit

public var datosUsuario = "USER_KEY"

class loginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func loginTouch(_ sender: Any) {

        let pass = passwordTextField.text!
        let email = emailTextField.text!


        let user = User(name: "", email: email, password: pass)
        
        //let postRequest = APIRequest(endpoint: "users/login")
        let postRequest = APIManager(endpoint: "users/login")

        postRequest.login(user, completion: {result in
            switch result{
            case .success(let user):
                print("El siguiente usuario ha sido enviado:\(user.email) ")
                UserDefaults.standard.set(user.email, forKey: datosUsuario)
                UserDefaults.standard.synchronize()
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let vc = storyboard.instantiateViewController(identifier: "listVC") as! listViewController
                        
                vc.modalPresentationStyle = .overFullScreen
                
                self.present(vc, animated: true)
                
            case .failure(let error):
                print("Ha ocurrido un error \(error)")
            }
        })

    }
        
    
    @IBAction func registerButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "registerVC") as! registerViewController
                
        //vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: true)
    }
    
    
    @IBAction func changePass(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "changeVC") as! changePassController
                
        //vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: true)
    }
    
}
