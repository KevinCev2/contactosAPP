//
//  Register.swift
//  rutas
//
//  Created by alumnos on 28/01/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit

class registerViewController: UIViewController {
    
//    let URL_SAVE_TEAM = "http://localhost:8888/rutasAPI/public/api/users/register"
//
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confirmPassField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
    }


    @IBAction func registerButton(_ sender: Any) {
        
       if passField.text! != confirmPassField.text! {
            print("contraseñas incorrectas")
            return
        }else{
            
            let userText = userField.text!
            let emailText = emailField.text!
            let passText = passField.text!
            
        //let user = User(email: emailText, name: userText, password: passText)
        
        let user = User(name: userText, email: emailText, password: passText)
        
        //let postRequest = APIManager(endpoint: "api/register")
        let postRequest = APIManager(endpoint: "users/create")
            
            //let postRequest = APIRequest(endpoint: "users/create")
            
        postRequest.register(user, completion: {result in
                switch result{
                case .success(let user):
                    print("El siguiente usuario ha sido enviado:\(user.email) ")
                case .failure(let error):
                    print("Ha ocurrido un error \(error)")
                    //print(JSONDecoder.decode(User.self))
                    //print(user.email)
                }
            })
            
        }
//
//
}
}
