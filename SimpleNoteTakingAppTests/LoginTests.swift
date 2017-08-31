//
//  LoginTests.swift
//  SimpleNoteTakingApp
//
//  Created by Carlos Cortés Sánchez on 31/08/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import XCTest
import KIF

class LoginTests: BaseUITests {
    
    override func beforeEach() {
        super.beforeEach()
        clearOutUsernameAndPasswordFields()
    }
    
    func testEmptyUsernameAndPassword() {
        tapButton(buttonName: "Login")
        expectToSeeAlert(text: "Username cannot be empty")
        tapButton(buttonName: "OK")
    }
    
    func testEmptyPassword() {
        fillInUsername()
        tapButton(buttonName: "Login")
        expectToSeeAlert(text: "Password cannot be empty")
        tapButton(buttonName: "OK")
    }
    
    func testWrongUsernameOrPassword() {
        fillInUsername()
        fillInWrongPassword()
        tapButton(buttonName: "Login")
        expectToSeeAlert(text: "Username or password is incorrect")
        tapButton(buttonName: "OK")
    }
    
    func testCorrectUsernameAndPassword() {
        fillInUsername()
        fillInPassword()
        tapButton(buttonName: "Login")
        expectToGoToHomeScreen() 
    }
}
