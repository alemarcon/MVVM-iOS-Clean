//
//  SummaryIntegrationTest.swift
//  MVVM-CleanTests
//
//  Created by Alessandro Marcon on 20/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import XCTest
import Swinject
@testable import MVVM_Clean

class SummaryIntegrationTest {
    
    private var expectation: XCTestExpectation
    private var xcTestCase: XCTestCase
    
    private var summaryUseCase: SummaryUseCaseDelegate?
    
    init(xcTestCase: XCTestCase) {
        
        // Initialize properties
        self.xcTestCase = xcTestCase
        expectation = XCTestExpectation(description: "Summary data: get correctly summary data")
        
    }
    
    /// Get summary data and check if it will be correctly decoded
    func runSummaryDataTest() {
        Assembler.type = .SummaryTest
        
        summaryUseCase = Assembler.sharedAssembler.resolver.resolve(SummaryUseCaseDelegate.self)
        summaryUseCase?.responseDelegate = self
        summaryUseCase?.summaryRepository?.isRunningFromTest = true
        summaryUseCase?.getSummaryData()
        
        xcTestCase.wait(for: [expectation], timeout: 10.0)
    }
    
}

extension SummaryIntegrationTest: SummaryUseCaseResponseDelegate {
    
    func onSummaryDataReceived(summary: Summary) {
        expectation.fulfill()
    }
    
    func onSummaryDataFailure(error: CustomError) {
        expectation.fulfill()
        XCTFail()
    }
}
