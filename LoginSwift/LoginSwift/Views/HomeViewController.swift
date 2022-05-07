//
//  HomeViewController.swift
//  LoginSwift
//
//  Created by Victor Roldan on 4/05/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printUserInfo()
    }
    
    func printUserInfo(){
        userEmailLabel.text = "  Email: "
        userIdLabel.text = "  Id: "
        userNameLabel.text = "  Name: "
        
        userEmailLabel.layer.masksToBounds = true
        userIdLabel.layer.masksToBounds = true
        userNameLabel.layer.masksToBounds = true
        userEmailLabel.layer.cornerRadius = 5
        userIdLabel.layer.cornerRadius = 5
        userNameLabel.layer.cornerRadius = 5
       
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        print("redirect to login")
        
    }
}
