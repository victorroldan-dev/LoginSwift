//
//  LoginViewElements.swift
//  LoginSwiftUITests
//
//  Created by Victor Roldan on 2/10/22.
//

import XCTest
@testable import LoginSwift

class LoginBase : XCTestCase{
    enum Login: String{
        case emailTextField
        case passwordTextField
        case passwordSecurField
        case loginButton
        case eyeButton
        case alert
        case okButtonAlert = "Ok"
        
        var element: XCUIElement{
            switch self{
            case .emailTextField:
                return XCUIApplication().textFields[Identifiers.email]
            case .passwordTextField:
                return XCUIApplication().textFields[Identifiers.password]
            case .passwordSecurField:
                return XCUIApplication().secureTextFields[Identifiers.password]
            case .loginButton:
                return XCUIApplication().buttons[Identifiers.loginButton]
            case .eyeButton:
                return XCUIApplication().buttons[Identifiers.eyeButton]
            case .alert:
                return XCUIApplication().alerts[Identifiers.alertErrorLogin]
            case .okButtonAlert:
                let element = XCUIApplication()
                    .alerts[Identifiers.alertErrorLogin]
                    .scrollViews
                    .otherElements
                    .buttons[self.rawValue]
                XCTAssertTrue(element.exists, "\(self.rawValue) button is missing")
                return element
            }
        }
    }
    
    enum Home: String{
        case userId
        case userName
        case userEmail
        case logoutButton
        
        var element: XCUIElement{
            switch self{
            case .userId:
                let element = XCUIApplication().staticTexts[Identifiers.userId]
                XCTAssertTrue(element.exists, "\(self.rawValue) Label is missing")
                return element
                
            case .userName:
                let element =  XCUIApplication().staticTexts[Identifiers.userName]
                XCTAssertTrue(element.exists, "\(self.rawValue) Label is missing")
                return element
                
            case .userEmail:
                let element = XCUIApplication().staticTexts[Identifiers.userEmail]
                XCTAssertTrue(element.exists, "\(self.rawValue) Label is missing")
                return element
                
            case .logoutButton:
                let element = XCUIApplication().buttons[Identifiers.logoutButton]
                XCTAssertTrue(element.exists, "\(self.rawValue) Button is missing")
                return element
            }
        }
    }
}
