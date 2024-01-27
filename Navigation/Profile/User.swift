//
//  User.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 03.12.2023.
//

import UIKit

protocol UserService {
    
    func authorization (forLogin login: String) -> User?
}

class User {
    var login: String
    var fullName: String
    var avatar: UIImage
    var status: String
    
    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

class CurrentUserService: UserService {
    var currentUser: User?
    
    init(currentUser: User?) {
        self.currentUser = currentUser
    }
    
    func authorization(forLogin login: String) -> User? {
        if login == currentUser?.login {
             return currentUser
         }
         return nil
    }
}

class TestUserService: UserService {
    
    func authorization(forLogin login: String) -> User? {
        let currentUserTest: User? = User(login: "test", fullName: "Test",  avatar: UIImage(named: "avatarTest") ?? UIImage(), status: "Тестирование профиля")
        
        if login == currentUserTest?.login {
             return currentUserTest
         }
         return nil
    }
}
