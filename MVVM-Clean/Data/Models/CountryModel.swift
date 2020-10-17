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
    var newConfirmed: String
    var totalConfirmed: String
    var newDeaths: String
    var totalDeaths: String
    var newRecovered: String
    var totalRecovered: String
    
    override init() {
        countryName = ""
        newConfirmed = ""
        totalConfirmed = ""
        newDeaths = ""
        totalDeaths = ""
        newRecovered = ""
        totalRecovered = ""
    }
    
    init(countryName: String, newConfirmed: String?, totalConfirmed: String?, newDeaths: String?, totalDeaths: String?, newRecovered: String?, totalRecovered: String?) {
        self.countryName = countryName
        self.newConfirmed = newConfirmed ?? ""
        self.totalConfirmed = totalConfirmed ?? ""
        self.newDeaths = newDeaths ?? ""
        self.totalDeaths = totalDeaths ?? ""
        self.newRecovered = newRecovered ?? ""
        self.totalRecovered = totalRecovered ?? ""
    }
    
    required convenience init(coder: NSCoder) {
        let countryName = coder.decodeObject(forKey: "countryName") as! String
        let newConfirmed = coder.decodeObject(forKey: "newConfirmed") as! String
        let totalConfirmed = coder.decodeObject(forKey: "totalConfirmed") as! String
        let newDeaths = coder.decodeObject(forKey: "newDeaths") as! String
        let totalDeaths = coder.decodeObject(forKey: "totalDeaths") as! String
        let newRecovered = coder.decodeObject(forKey: "newRecovered") as! String
        let totalRecovered = coder.decodeObject(forKey: "totalRecovered") as! String
        
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
