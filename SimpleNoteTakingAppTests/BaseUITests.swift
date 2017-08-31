//
//  BaseUITests.swift
//  SimpleNoteTakingApp
//
//  Created by Carlos Cortés Sánchez on 31/08/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import KIF
import Realm
import RealmSwift

class BaseUITests: KIFTestCase {
    override func beforeAll() {
        super.beforeAll()
        useTestDatabase()
    }
    
    override func beforeEach() {
        super.beforeEach()
        backToRoot()
    }
}
