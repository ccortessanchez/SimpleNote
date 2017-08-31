//
//  HomeTests.swift
//  SimpleNoteTakingApp
//
//  Created by Carlos Cortés Sánchez on 31/08/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import XCTest
import KIF

class HomeTests: BaseUITests {
    
    override func beforeEach() {
        super.beforeEach()
        haveNoNotes()
    }
    
    func testNoNotes() {
        visitHomeScreen()
        expectToSeeLabel(label: "No notes")
        expectNotToSeeNoteList()
    }
    
    func testCreateNewNote() {
        visitHomeScreen()
        tapButton(buttonName: "Add note")
        expectTheCreateButtonToBeDisabled()
        fillInNoteTitle("New note")
        expectTheCreateButtonToBeEnabled()
        fillInNoteBody("New body")
        tapButton(buttonName: "Create")
        expectToSeeNoteWithTitle("New note", body: "New body", atRow: 0)
        expectNumberOfNotesInListToEqual(count: 1)
    }
    
    func testEditANote() {
        have3notes()
        visitHomeScreen()
        tapOnNoteAtRow(1)
        updateNoteTitleTo("Updated note")
        updateNoteBodyTo("Updated body")
        tapButton(buttonName: "Update")
        expectToSeeNoteWithTitle("Updated note", body: "Updated body", atRow: 1)
    }
    
    func testDeleteNotes() {
        have3notes()
        visitHomeScreen()
        deleteANote()
        expectNumberOfNotesInListToEqual(count: 2)
        deleteANote()
        expectNumberOfNotesInListToEqual(count: 1)
        deleteANote()
        expectToSeeLabel(label: "No notes")
    }
}
