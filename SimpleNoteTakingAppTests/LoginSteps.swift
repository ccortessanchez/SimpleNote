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
    
    func fillInWrongPassword() {
        tester().enterText("wrongPassword", intoViewWithAccessibilityLabel: "Login - Password")
    }
    
    func expectToGoToHomeScreen() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Login - Username")
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Login - Password")
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Login")
        
        tester().waitForView(withAccessibilityLabel: "No notes")
        tester().waitForView(withAccessibilityLabel: "Add note")
    }
}
