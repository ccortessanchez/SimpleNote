//
//  HomeSteps.swift
//  SimpleNoteTakingApp
//
//  Created by Carlos Cortés Sánchez on 31/08/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

@testable import SimpleNoteTakingApp
import RealmSwift
import Nimble

extension HomeTests {
    
    func haveNoNotes() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func have3notes() {
        let realm = try! Realm()
        try! realm.write {
            for i in 0...2 {
                let note = Note()
                note.title = "title \(i)"
                note.body = "body \(i)"
                realm.add(note)
            }
        }
    }
    
    func expectToSeeLabel(label: String) {
        tester().waitForView(withAccessibilityLabel: label)
    }
    
    func expectNotToSeeNoteList() {
        tester().waitForAbsenceOfView(withAccessibilityLabel: "Note - Table View")
    }
    
    func expectTheCreateButtonToBeDisabled() {
        let createButton = tester().waitForView(withAccessibilityLabel: "Create") as! UIButton
        expect(createButton.isEnabled) == false
    }
    
    
    func expectToSeeNoteWithTitle(_ title: String, body: String, atRow row: NSInteger) {
        let noteCell = tester().waitForCell(at: IndexPath(row: row, section: 0), inTableViewWithAccessibilityIdentifier: "Note - TableView")
        expect(noteCell?.textLabel?.text) == title
        expect(noteCell?.detailTextLabel?.text) == body
    }
    
    func expectNumberOfNotesInListToEqual(count: Int) {
        let noteTableView = tester().waitForView(withAccessibilityLabel: "Note - TableView") as! UITableView
        expect(noteTableView.numberOfRows(inSection: 0)) == count
    }
    
    func expectTheCreateButtonToBeEnabled() {
        let createButton = tester().waitForView(withAccessibilityLabel: "Create") as! UIButton
        expect(createButton.isEnabled) == true
    }
    
    func fillInNoteTitle(_ title: String) {
        fillIn("Note - Title", withText: title)
    }
    
    func fillInNoteBody(_ body: String) {
        fillIn("Note - Body", withText: body)
    }
    
    func updateNoteTitleTo(_ title: String) {
        fillInNoteTitle(title)
    }
    
    func updateNoteBodyTo(_ body: String) {
        fillInNoteBody(body)
    }
    
    func tapOnNoteAtRow(_ row: Int) {
        let indexPath = IndexPath(row: row, section: 0)
        tester().tapRow(at: indexPath, inTableViewWithAccessibilityIdentifier: "Note - TableView")
    }
    
    func deleteANote() {
        let noteTableView = tester().waitForView(withAccessibilityLabel: "Note - TableView") as! UITableView
        let indexPath = IndexPath(row: 0, section: 0)
        tester().swipeRow(at: indexPath, in: noteTableView, in: .left)
        tapButton(buttonName: "Delete")
    }
}
