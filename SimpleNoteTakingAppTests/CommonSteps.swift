//
//  CommonSteps.swift
//  SimpleNoteTakingApp
//
//  Created by Carlos Cortés Sánchez on 31/08/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

@testable import SimpleNoteTakingApp
import Realm
import RealmSwift

extension BaseUITests {
    
    func useTestDatabase() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "testDB"
    }
    
    func backToRoot() {
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.popToRootViewController(animated: false)
        }
    }
    
    func visitHomeScreen() {
        fillInUsername()
        fillInPassword()
        tapButton(buttonName: "Login")
    }
    
    func fillInUsername() {
        fillIn("Login - Username", withText: correctUsername)
    }
    
    func fillInPassword() {
        tester().enterText("password", intoViewWithAccessibilityLabel: "Login - Password")
    }
    
    func tapButton(buttonName: String) {
        tester().tapView(withAccessibilityLabel: buttonName)
    }
    
    func fillIn(_ accessibilityLabel: String, withText text: String) {
        tester().clearText(fromAndThenEnterText: text, intoViewWithAccessibilityLabel: accessibilityLabel)
    }
    
    func expectToSeeAlert(text: String) {
        tester().waitForView(withAccessibilityLabel: text)
    }
}
