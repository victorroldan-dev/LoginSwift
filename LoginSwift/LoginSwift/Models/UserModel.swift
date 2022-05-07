//
//  UserModel.swift
//  LoginSwift
//
//  Created by Victor Roldan on 4/05/22.
//

import Foundation

struct UserModel : Decodable{
    let users : [Users]?
    
    struct Users : Decodable{
        let id : String
        let name : String
        let email : String
        let password : String
        let accessToken : String
    }
}
