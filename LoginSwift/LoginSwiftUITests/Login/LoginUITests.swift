//
//  LoginSwiftUITests.swift
//  LoginSwiftUITests
//
//  Created by Victor Roldan on 1/10/22.
//

import XCTest
@testable import LoginSwift

class LoginUITests: LoginBase {
    var app : XCUIApplication!
    var timeout : TimeInterval = 1.0
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        timeout = 1.0
    }
    
    func testLogin_ShouldFail_BecauseOfBadCredentials() {
        textValidations()
        
        fillLoginFields(email: "victorroldan.dev@gmail.com", password: "hola")
        
        //Hit login button
        Login.loginButton.element.tap()
        
        alertBehaviour()
    }

    func testLogin_ShouldSuccess_AndValidateThatHomeExists() throws {
        textValidations()
        
        fillLoginFields(email: "victorroldan.dev@gmail.com", password: "123")
        
        eyeButtonBehaviour()
        
        //Hit the login button
        Login.loginButton.element.tap()
        
        openHomeAndValidateLabels()
        
        //Validate that the email TextField exists after logout
        XCTAssert(Login.emailTextField.element.waitForExistence(timeout: 0.5))
    }
}

extension LoginUITests{
    private func openHomeAndValidateLabels(){
        XCTContext.runActivity(named: "Open Home and Validate Labels") { activity in

            //Validate Id Value
            //XCTAssertTrue(Home.userId.element.exists, "UserId Label is missing")
            let idLabel = Home.userId.element.label
            let expectedId = "  Id: 234"
            XCTAssertEqual(idLabel, expectedId)
            
            //Validate Name Value
            //XCTAssertTrue(Home.userName.element.exists, "UserName Label is missing")
            let nameLabel = Home.userName.element.label
            let expectedName = "  Name: Victor"
            XCTAssertEqual(nameLabel, expectedName)
            
            //Validate Email Value
            //XCTAssertTrue(Home.userEmail.element.exists, "UserEmail Label is missing")
            let emailLabel = Home.userEmail.element.label
            let expectedEmail = "  Email: victorroldan.dev@gmail.com"
            XCTAssertEqual(emailLabel, expectedEmail)
            
            //Hit the logout button
            Home.logoutButton.element.tap()
        }
    }
    
    private func textValidations(){
        XCTContext.runActivity(named: "Valadatin Texts") { activity in
            let emailTF = Login.emailTextField.element
            let passwordTF = Login.passwordSecurField.element
            let loginButton = Login.loginButton.element
            
            let expectedEmailPlaceholder = "Email"
            let expectedPasswordPlaceholder = "Password"
            let expectedLoginButtonTitle = "Log In"
            
            XCTAssertEqual(emailTF.placeholderValue, expectedEmailPlaceholder)
            XCTAssertEqual(passwordTF.placeholderValue, expectedPasswordPlaceholder)
            XCTAssertEqual(loginButton.label, expectedLoginButtonTitle)
        }
    }
    
    private func alertBehaviour(){
        XCTContext.runActivity(named: "") { activity in
            //Get alert view
            let alert = Login.alert.element
            
            //Validate that Alert is shown after the login button was pressed
            XCTAssertTrue(alert.waitForExistence(timeout: 0.5))
            
            //Hit the Ok button
            Login.okButtonAlert.element.tap()
            
            //Validate that already disappears after hitting the OK button
            XCTAssertFalse(alert.waitForExistence(timeout: 0.1))
        }
    }
    
    private func eyeButtonBehaviour(){
        XCTContext.runActivity(named: "checking the eye button behaviour") { activity in
            //Get the eye button
            let eyeButton = Login.eyeButton.element
            eyeButton.tap()
            //Validate that TextField is not a SecureTextField
            XCTAssertNotEqual(Login.passwordTextField.element.elementType, .secureTextField, "This element should be a normal TextField after pressing the eye button")
            
            eyeButton.tap()
            //Validate secureTextField is a real secureTextField
            XCTAssertEqual(Login.passwordSecurField.element.elementType, .secureTextField, "This element should be secureTextField after hitting the eye button for 2nd time")
        }
    }
    
    private func fillLoginFields(email: String, password: String){
        XCTContext.runActivity(named: "Fill Login View") { _ in
            //Enter email
            let emailTF = Login.emailTextField.element
            XCTAssertTrue(emailTF.exists, "email is missing")
            emailTF.tap()
            emailTF.typeText(email)
            
            //Enter Password
            let passwordTF = Login.passwordSecurField.element
            XCTAssertTrue(passwordTF.exists, "password is missing")
            passwordTF.tap()
            passwordTF.typeText(password)
        }
    }
}
