//
//  SummaryPersistenceRequest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
/**
 This is the implementation of SummaryLocalProtocolRequest. For simplicity, we use UserDefaults instead of a real datatabase.
 Here, we are going to implement the methods that will be used to locally save and retrieve summary data.
 */
class SummaryPersistenceRequest: SummaryPersistenceProtocolRequest {
    
    private let SUMMARY_DTO = "summary_codable_object_sto"
    
    /// Save DTO Summary object to UserDefaults
    /// - Parameter data: Summary data to save locally
    /// - Throws:
    func saveLocalSummaryDTO(data: Summary) {
        LOGFSTART()
        let userDefaults = UserDefaults.standard
        
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(data)
            userDefaults.set(encoded, forKey: SUMMARY_DTO)
            userDefaults.synchronize()
        } catch (let error){
            LOGE(error.localizedDescription)
        }
    }
    
    /// Get local summary DTO model from UserDefaults. If no data is stored, nil will be returned
    /// - Throws:
    /// - Returns: Summary object if is present, nil otherwise
    func getLocalSummaryDataDTO() -> Summary? {
        LOGFSTART()
        let userDefaults = UserDefaults.standard
        do {
            if let summaryDTO = userDefaults.object(forKey: SUMMARY_DTO) as? Data {
                let decoder = JSONDecoder()
                let loadedSummary = try decoder.decode(Summary.self, from: summaryDTO)
                return loadedSummary
            }
        } catch (let error) {
            LOGE(error.localizedDescription)
        }
        return nil
    }
    
}
