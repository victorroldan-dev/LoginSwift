//
//  LoginViewControllerTests.swift
//  LoginViewControllerTests
//
//  Created by Victor Roldan on 3/10/22.
//

import XCTest
@testable import LoginSwift

final class LoginViewControllerTests: XCTestCase {
    var sut : LoginViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLogin_ValidateTextFields_AreEmpty() throws {
        let email = try XCTUnwrap(sut.emailTextField)
        let password = try XCTUnwrap(sut.passwordTextField)
        
        XCTAssertEqual(email.text, "", "The email TextField should be empty")
        XCTAssertEqual(password.text, "", "The password TextField should be empty")
    }
    
    func testLogin_EmailTextFieldKeyboardType_ShouldBe_EmailAddress() throws {
        let email = try XCTUnwrap(sut.emailTextField)

        XCTAssertEqual(email.keyboardType, .emailAddress, "the keyboardType should be emailAdress")
    }
    
    func testLogin_EmailTextFieldTextContentType_ShouldBe_EmailAddress() throws {
        let email = try XCTUnwrap(sut.emailTextField)

        XCTAssertEqual(email.textContentType, .emailAddress, "the textContentType should be emailAdress")
    }

    func testLogin_PasswordTextField_ShouldBe_SecureTextEntry() throws{
        let password = try XCTUnwrap(sut.passwordTextField)
        
        XCTAssertTrue(password.isSecureTextEntry, "the passwordTextField should be secure text entry")
    }
    
    func testLogin_TheLoginButton_ShouldChangeItState_WhenFillUpLoginTextFields() throws{
        let loginButton = try XCTUnwrap(sut.loginButton)
        
        XCTAssertFalse(loginButton.isEnabled)
        
        sut.passwordTextField.text = "hello"
        sut.emailTextField.text = "victorroldan.dev@gmail.com"
        sut.textFieldDidChange(sut.passwordTextField)
        
        XCTAssertTrue(loginButton.isEnabled)
    }

}
