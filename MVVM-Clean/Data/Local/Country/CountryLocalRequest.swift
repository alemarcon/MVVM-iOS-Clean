//
//  CountryLocalRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CountryLocalRequest: CountryLocalProtocolRequest {
    
    private let COUNTRY = "country_codable_object"
    
    func getLocalCountryData() -> [CountryModel]? {
        let userDefaults = UserDefaults.standard
        guard let decoded  = userDefaults.object(forKey: COUNTRY) as? Data else {
            return nil
        }
        
        guard let country = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? [CountryModel] else {
            return nil
        }
        
        return country
    }
    
    func saveLocalCountries(data: [CountryModel]) {
        let userDefaults = UserDefaults.standard
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: data)
        userDefaults.set(encodedData, forKey: COUNTRY)
        userDefaults.synchronize()
    }
    
}
