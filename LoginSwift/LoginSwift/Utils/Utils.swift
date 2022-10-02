//
//  Utils.swift
//  LoginSwift
//
//  Created by Victor Roldan on 4/05/22.
//

import Foundation

class Utils{
    static func parseJson<T: Decodable>(jsonName : String, model: T.Type) -> T?{
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        do{
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            do{
                let responseModel = try jsonDecoder.decode(T.self, from: data)
                return responseModel
            }catch{
                debugPrint("json mock error: \(error)")
                return nil
            }
        }catch{
            return nil
        }
    }
}

public struct Identifiers{
    static let email = "email"
    static let password = "password"
    static let loginButton = "login-button"
    static let eyeButton = "eye-button"
    static let forgotPassword = "forgot-passwod-button"
    static let alertErrorLogin = "alert-error-login"
    
    static let userId = "id-label"
    static let userName = "name-label"
    static let userEmail = "email-label"
    static let logoutButton = "logout-button"
}
