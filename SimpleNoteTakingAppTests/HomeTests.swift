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
    
    override func beforeAll() {
        useTestDatabase()
    }
    
    override func beforeEach() {
        backToRoot()
        haveNoNotes()
    }
    
    func testNoNotes() {
        visitHomeScreen()
        expectToSeeLabel(label: "No notes")
        expectNotToSeeNoteList()
    }
    
    func testCreateNewNote() {
        haveNoNotes()
        visitHomeScreen()
        tapButton(buttonName: "Add note")
        expectTheCreateButtonToBeDisabled()
        fillInNoteTitle("new note")
        expectTheCreateButtonToBeEnabled()
        fillInNoteBody("new body")
        tapButton(buttonName: "Create")
        expectToSeeNoteWithTitle("new note", body: "new body", atRow: 0)
        expectNumberOfNotesInListToEqual(count: 1)
    }
    
    func testEditANote() {
        have3notes()
        visitHomeScreen()
        tapOnNoteAtRow(1)
        updateNoteTitleTo("updated note")
        updateNoteBodyTo("updated body")
        tapButton(buttonName: "Update")
        expectToSeeNoteWithTitle("updated note", body: "updated body", atRow: 1)
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
