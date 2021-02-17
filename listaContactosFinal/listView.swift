//
//  listView.swift
//  listaContactosFinal
//
//  Created by alumnos on 16/02/2021.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
import UIKit

class listViewController: UIViewController, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    var users1 : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let getRequest = APIManager(endpoint: "")
        
        getRequest.getUser({result, users  in
            switch result{
            case .success(_):
                //print("Los datos han sido recibidos: \(String(describing: users))")
                //print(users!)
                
                self.users1 = users!
                self.tableView.reloadData()
                print(self.users1)

            case .failure(_):
                print("No se han podido recibir datos")
            case .none: break
            }
        })
        //print(users1)
    }
    @IBAction func perfilButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(identifier: "perfilVC") as! perfilViewController
                
        //vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: true)
        
    }
}

extension listViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellUser", for: indexPath)
        
        //print(users1)
        
        cell.textLabel?.text = users1[indexPath.row]
        
        return cell
        
    }
    
    
}
