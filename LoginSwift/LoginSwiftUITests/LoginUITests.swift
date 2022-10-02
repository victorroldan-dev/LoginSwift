//
//  LoginSwiftUITests.swift
//  LoginSwiftUITests
//
//  Created by Victor Roldan on 1/10/22.
//

import XCTest
@testable import LoginSwift

final class LoginUITests: XCTestCase {
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
    
    func testLogin_ShouldFail_BecauseOfBadCredentials() throws {
        /*
        let email = app.textFields[Identifiers.email]
        email.tap()
        email.typeText("victorroldan.dev@gmail.com")
        
        let password = app.secureTextFields[Identifiers.password]
        password.tap()
        password.typeText("hola")//<- this is a wrong password
        */
        fillLoginFields(email: "victorroldan.dev@gmail.com", password: "hola")
        
        //Hit login button
        app.buttons[Identifiers.loginButton].tap()
        
        //Get alert view
        let alert = app.alerts[Identifiers.alertErrorLogin]
        
        //Validate that Alert is shown after the login button was pressed
        XCTAssertTrue(alert.waitForExistence(timeout: 0.5))
        
        //Hit the Ok button
        alert.scrollViews.otherElements.buttons["Ok"].tap()
        
        //Validate that already disappears after hitting the OK button
        XCTAssertFalse(alert.waitForExistence(timeout: 0.1))
    }
    

    func testLogin_ShouldSuccess_AndValidateThatHomeExists() throws {
        /*
        let email = app.textFields[Identifiers.email]
        email.tap()
        email.typeText("victorroldan.dev@gmail.com")
        
        let password = app.secureTextFields[Identifiers.password]
        password.tap()
        password.typeText("123")
        */
        fillLoginFields(email: "victorroldan.dev@gmail.com", password: "123")
        
        //Get the eye button
        let eyeButton = app.buttons[Identifiers.eyeButton]
        eyeButton.tap()
        //Validate that TextField is not a SecureTextField
        XCTAssertNotEqual(app.textFields[Identifiers.password].elementType, .secureTextField, "This element should be a normal TextField after pressing the eye button")
        
        eyeButton.tap()
        //Validate secureTextField is a real secureTextField
        XCTAssertEqual(app.secureTextFields[Identifiers.password].elementType, .secureTextField, "This element should be secureTextField after hitting the eye button for 2nd time")
        
        //Hit the login button
        app.buttons[Identifiers.loginButton].tap()
        
        //Validate Id Value
        let idLabel = app.staticTexts[Identifiers.userId].label
        let expectedId = "  Id: 234"
        XCTAssertEqual(idLabel, expectedId)
        
        //Validate Name Value
        let nameLabel = app.staticTexts[Identifiers.userName].label
        let expectedName = "  Name: Victor"
        XCTAssertEqual(nameLabel, expectedName)
        
        //Validate Email Value
        let emailLabel = app.staticTexts[Identifiers.userEmail].label
        let expectedEmail = "  Email: victorroldan.dev@gmail.com"
        XCTAssertEqual(emailLabel, expectedEmail)
        
        //Hit the logout button
        app.buttons[Identifiers.logoutButton].tap()
        
        //Validate that the email TextField exists after logout
        XCTAssert(app.textFields[Identifiers.email].waitForExistence(timeout: 0.5))
    }
    
    func testTextValidations() throws{
        let emailTF = app.textFields[Identifiers.email]
        let passwordTF = app.secureTextFields[Identifiers.password]
        let loginButton = app.buttons[Identifiers.loginButton]
        
        let expectedEmailPlaceholder = "Email"
        let expectedPasswordPlaceholder = "Password"
        let expectedLoginButtonTitle = "Log In"
        
        XCTAssertEqual(emailTF.placeholderValue, expectedEmailPlaceholder)
        XCTAssertEqual(passwordTF.placeholderValue, expectedPasswordPlaceholder)
        XCTAssertEqual(loginButton.label, expectedLoginButtonTitle)
    }
}

extension LoginUITests{
    
    private func fillLoginFields(email: String, password: String){
        //Enter email
        let emailTF = app.textFields[Identifiers.email]
        emailTF.tap()
        emailTF.typeText(email)
        
        //Enter Password
        let passwordTF = app.secureTextFields[Identifiers.password]
        passwordTF.tap()
        passwordTF.typeText(password)
    }
}
