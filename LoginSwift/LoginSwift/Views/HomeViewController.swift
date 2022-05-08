//
//  HomeViewController.swift
//  LoginSwift
//
//  Created by Victor Roldan on 4/05/22.
//

import UIKit
import SwiftKeychainWrapper

class HomeViewController: UIViewController {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    private var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printUserInfo()
        
        print("email: ", defaults.string(forKey: "email"))
    }
    
    func printUserInfo(){
        let email: String? = KeychainWrapper.standard.string(forKey: "email")
        let id: String? = KeychainWrapper.standard.string(forKey: "id")
        let name: String? = KeychainWrapper.standard.string(forKey: "name")
        let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
        
        
        userEmailLabel.text = "  Email: "+email!
        userIdLabel.text = "  Id: "+id!
        userNameLabel.text = "  Name: "+name!
        print("AccessToken: ", accessToken!)
        
        userEmailLabel.layer.masksToBounds = true
        userIdLabel.layer.masksToBounds = true
        userNameLabel.layer.masksToBounds = true
        userEmailLabel.layer.cornerRadius = 5
        userIdLabel.layer.cornerRadius = 5
        userNameLabel.layer.cornerRadius = 5
       
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        KeychainWrapper.standard.removeObject(forKey: "email")
        KeychainWrapper.standard.removeObject(forKey: "id")
        KeychainWrapper.standard.removeObject(forKey: "name")
        KeychainWrapper.standard.removeObject(forKey: "accessToken")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
            view.window?.windowScene?.keyWindow?.rootViewController = vc
            view.window?.windowScene?.keyWindow?.makeKeyAndVisible()
        }
    }
}
