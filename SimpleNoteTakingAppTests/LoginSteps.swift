//
//  LoginSteps.swift
//  SimpleNoteTakingApp
//
//  Created by Carlos Cortés Sánchez on 31/08/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

extension LoginTests {
    func clearOutUsernameAndPasswordFields() {
        tester().clearTextFromView(withAccessibilityLabel: "Login - Username")
        tester().clearTextFromView(withAccessibilityLabel: "Login - Password")
    }
    
    func tapButton(buttonName: String) {
        tester().tapView(withAccessibilityLabel: buttonName)
    }
    
    func expectToSeeAlert(text: String) {
        tester().waitForView(withAccessibilityLabel: text)
    }
    
    func fillInUsername() {
        tester().enterText("appcoda", intoViewWithAccessibilityLabel: "Login - Username")
    }
}
