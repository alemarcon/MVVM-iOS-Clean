//
//  SummaryModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummaryModel: NSObject, NSCoding {

    var newConfirmedCases: String
    var totalConfirmedCases: String
    var newDeath: String
    var totalDeaths: String
    var newRecoveredCases: String
    var totalRecovered: String
    var lastUpdate: Date
    
    override init() {
        newConfirmedCases = "0"
        totalConfirmedCases = "0"
        newDeath = "0"
        totalDeaths = "0"
        newRecoveredCases = "0"
        totalRecovered = "0"
        lastUpdate = CustomDateUtils.currentDate()
    }
    
    init(newConfirmedCases: String, totalConfirmedCases: String, newDeath: String, totalDeaths: String, newRecoveredCases: String, totalRecovered: String, lastUpdate: Date) {
        
        self.newConfirmedCases = newConfirmedCases
        self.totalConfirmedCases = totalConfirmedCases
        self.newDeath = newDeath
        self.totalDeaths = totalDeaths
        self.newRecoveredCases = newRecoveredCases
        self.totalRecovered = totalRecovered
        self.lastUpdate = lastUpdate
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(newConfirmedCases, forKey: "newConfirmedCases")
        coder.encode(totalConfirmedCases, forKey: "totalConfirmedCases")
        coder.encode(newDeath, forKey: "newDeath")
        coder.encode(totalDeaths, forKey: "totalDeaths")
        coder.encode(newRecoveredCases, forKey: "newRecoveredCases")
        coder.encode(totalRecovered, forKey: "totalRecovered")
        coder.encode(lastUpdate, forKey: "lastUpdate")
    }
    
    required convenience init(coder: NSCoder) {
        let newConfirmedCases = coder.decodeObject(forKey: "newConfirmedCases") as! String
        let totalConfirmedCases = coder.decodeObject(forKey: "totalConfirmedCases") as! String
        let newDeath = coder.decodeObject(forKey: "newDeath") as! String
        let totalDeaths = coder.decodeObject(forKey: "totalDeaths") as! String
        let newRecoveredCases = coder.decodeObject(forKey: "newRecoveredCases") as! String
        let totalRecovered = coder.decodeObject(forKey: "totalRecovered") as! String
        let lastUpdate = coder.decodeObject(forKey: "lastUpdate") as! Date
        
        self.init(newConfirmedCases: newConfirmedCases, totalConfirmedCases: totalConfirmedCases, newDeath: newDeath, totalDeaths: totalDeaths, newRecoveredCases: newRecoveredCases, totalRecovered: totalRecovered, lastUpdate: lastUpdate)
    }
}
