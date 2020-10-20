//
//  SummaryModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation


struct SummaryModel {

    var newConfirmedCases: String
    var totalConfirmedCases: String
    var newDeath: String
    var totalDeaths: String
    var newRecoveredCases: String
    var totalRecovered: String
    var lastUpdate: Date
    
    init() {
        newConfirmedCases = "0"
        totalConfirmedCases = "0"
        newDeath = "0"
        totalDeaths = "0"
        newRecoveredCases = "0"
        totalRecovered = "0"
        lastUpdate = CustomDateUtils.currentDate()
    }
}
