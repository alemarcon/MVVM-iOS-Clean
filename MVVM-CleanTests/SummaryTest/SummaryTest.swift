//
//  SummaryTest.swift
//  MVVM-CleanTests
//
//  Created by Alessandro Marcon on 20/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import XCTest
@testable import MVVM_Clean

class SummaryTest: XCTestCase {

    func testSummary() throws {
        let summaryTest = SummaryIntegrationTest(xcTestCase: self)
        summaryTest.runSummaryDataTest()
    }

}
