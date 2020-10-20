//
//  CountryModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

struct CountryModel {
    
    var countryName: String
    var newConfirmed: String
    var totalConfirmed: String
    var newDeaths: String
    var totalDeaths: String
    var newRecovered: String
    var totalRecovered: String
    
    init() {
        countryName = ""
        newConfirmed = ""
        totalConfirmed = ""
        newDeaths = ""
        totalDeaths = ""
        newRecovered = ""
        totalRecovered = ""
    }
    
}
