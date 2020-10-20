//
//  CountryLocalRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/**
 This is the implementation of CountryLocalProtocolRequest. For simplicity, we use UserDefaults instead of a real datatabase.
 Here, we are going to implement the methods that will be used to locally save and retrieve country data.
 */
class CountryLocalRequest: CountryLocalProtocolRequest {
    
    private let COUNTRY_DTO = "country_codable_object_dto"
    
    func saveLocalCountryDataDTO(data: [Country]) {
        LOGFSTART()
        let userDefaults = UserDefaults.standard
        
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(data)
            userDefaults.set(encoded, forKey: COUNTRY_DTO)
            userDefaults.synchronize()
        } catch (let error){
            LOGE(error.localizedDescription)
        }
    }
    
    func getLocalCountryDataDTO() -> [Country]? {
        LOGFSTART()
        let userDefaults = UserDefaults.standard
        do {
            if let countryDTO = userDefaults.object(forKey: COUNTRY_DTO) as? Data {
                let decoder = JSONDecoder()
                let loadedCountries = try decoder.decode([Country].self, from: countryDTO)
                return loadedCountries
            }
        } catch (let error) {
            LOGE(error.localizedDescription)
        }
        return nil
    }
    
}
