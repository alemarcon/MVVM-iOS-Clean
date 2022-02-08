//
//  Summary.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation


struct Summary {
    var summaryConfirmed: SummaryConfirmed
    var summaryDeath: SummaryDeath
    var summaryRecovered: SummaryRecovered
    var lastUpdate: Date
    
    init() {
        summaryConfirmed = SummaryConfirmed()
        summaryDeath = SummaryDeath()
        summaryRecovered = SummaryRecovered()
        lastUpdate = CustomDateUtils.currentDate()
    }
}

protocol SummaryData {
    var title: String { get set }
}

struct SummaryConfirmed: SummaryData {
    var title: String
    var newConfirmedCases: String
    var totalConfirmedCases: String
    
    init() {
        title = NSLocalizedString("new_confirmed_cases", comment: "")
        newConfirmedCases = "0"
        totalConfirmedCases = "0"
    }
}

struct SummaryDeath: SummaryData {
    var title: String
    var newDeath: String
    var totalDeaths: String
    
    init() {
        title = NSLocalizedString("new_deaths_cases", comment: "")
        newDeath = "0"
        totalDeaths = "0"
    }
}

struct SummaryRecovered: SummaryData {
    var title: String
    var newRecoveredCases: String
    var totalRecovered: String
    
    init() {
        title = NSLocalizedString("new_recovered", comment: "")
        newRecoveredCases = "0"
        totalRecovered = "0"
    }
}
