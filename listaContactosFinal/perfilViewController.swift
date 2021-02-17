//
//  perfilViewController.swift
//  listaContactosFinal
//
//  Created by alumnos on 17/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit

class perfilViewController: UIViewController {

    
    @IBOutlet weak var emailText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (UserDefaults.standard.string(forKey: datosUsuario) != nil){
            emailText.text = datosUsuario
        }else{
            print("No hay datos")
        }
        
        //print(users1)
    }
}
