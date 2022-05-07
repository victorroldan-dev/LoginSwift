//
//  ViewController.swift
//  LoginSwift
//
//  Created by Victor Roldan on 4/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var eyeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutLoginButton()
        layoutTextFields()
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    private func layoutTextFields(){
        let paddingLeftEmail = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        let paddingLeftPwd = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        emailTextField.leftView = paddingLeftEmail
        passwordTextField.leftView = paddingLeftPwd
        emailTextField.leftViewMode = .always
        passwordTextField.leftViewMode = .always
        emailTextField.layer.cornerRadius = 5.0
        passwordTextField.layer.cornerRadius = 5.0
        
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.5)]
        )
    }
    
    private func layoutLoginButton(){
        let color1 : UIColor = UIColor(red: 105/255, green: 161/255, blue: 248/255, alpha: 1.0)
        let color2 : UIColor = UIColor(red: 68/255, green: 107/255, blue: 234/255, alpha: 1.0)

        loginButton.tintColor = .white
        loginButton.layer.cornerRadius = 5
        loginButton.clipsToBounds = true
        
        let gradientLayer : CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = loginButton.frame.size
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        loginButton.layer.addSublayer(gradientLayer)
    }
    
    
    @IBAction func eyeButtonPressed(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        
        let icon : String = passwordTextField.isSecureTextEntry ? "eye.fill" : "eye.slash"
        eyeButton.setImage(UIImage(systemName: icon), for: .normal)
    }
    
    
    @objc func loginButtonPressed(){
        print("loginButtonPressed")
    }
    
    func showAlert(_ message : String){
        let alert = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            if action.style == .cancel{
                print("ok button pressed")
            }
        }))
        
        present(alert, animated: true)
    }
}
