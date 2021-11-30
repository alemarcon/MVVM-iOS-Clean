//
//  MVVM_CleanUITests.swift
//  MVVM-CleanUITests
//
//  Created by Alessandro Marcon on 24/11/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import XCTest

class MVVM_CleanUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        // Since UI tests are more expensive to run, it's usually a good idea
        // to exit if a failure was encountered
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitesting")
    }
    
    func testLoginViewController() throws {
        app.launch()
        // Make sure we're displaying login view controller
        XCTAssertTrue(app.isDisplayingLoginViewController)
    }
}


extension XCUIApplication {
    
    var isDisplayingLoginViewController: Bool {
        return otherElements["loginViewController"].exists
    }
    
}
