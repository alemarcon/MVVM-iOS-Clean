//
//  CountryModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CountryModel: NSObject, NSCoding {
    
    var countryName: String
    var newConfirmed: Int32
    var totalConfirmed: Int32
    var newDeaths: Int32
    var totalDeaths: Int32
    var newRecovered: Int32
    var totalRecovered: Int32
    
    override init() {
        countryName = ""
        newConfirmed = 0
        totalConfirmed = 0
        newDeaths = 0
        totalDeaths = 0
        newRecovered = 0
        totalRecovered = 0
    }
    
    init(countryName: String, newConfirmed: Int32?, totalConfirmed: Int32?, newDeaths: Int32?, totalDeaths: Int32?, newRecovered: Int32?, totalRecovered: Int32?) {
        self.countryName = countryName
        self.newConfirmed = newConfirmed ?? 0
        self.totalConfirmed = totalConfirmed ?? 0
        self.newDeaths = newDeaths ?? 0
        self.totalDeaths = totalDeaths ?? 0
        self.newRecovered = newRecovered ?? 0
        self.totalRecovered = totalRecovered ?? 0
    }
    
    required convenience init(coder: NSCoder) {
        let countryName = coder.decodeObject(forKey: "countryName") as! String
        let newConfirmed = coder.decodeInt32(forKey: "newConfirmed")
        let totalConfirmed = coder.decodeInt32(forKey: "totalConfirmed")
        let newDeaths = coder.decodeInt32(forKey: "newDeaths")
        let totalDeaths = coder.decodeInt32(forKey: "totalDeaths")
        let newRecovered = coder.decodeInt32(forKey: "newRecovered")
        let totalRecovered = coder.decodeInt32(forKey: "totalRecovered")
        
        self.init(countryName: countryName, newConfirmed: newConfirmed, totalConfirmed: totalConfirmed, newDeaths: newDeaths, totalDeaths: totalDeaths, newRecovered: newRecovered, totalRecovered: totalRecovered)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(countryName, forKey: "countryName")
        coder.encode(newConfirmed, forKey: "newConfirmed")
        coder.encode(totalConfirmed, forKey: "totalConfirmed")
        coder.encode(newDeaths, forKey: "newDeaths")
        coder.encode(totalDeaths, forKey: "totalDeaths")
        coder.encode(newRecovered, forKey: "newRecovered")
        coder.encode(totalRecovered, forKey: "totalRecovered")
    }
}
