//
//  SummaryLocalRequest.swift
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
class SummaryLocalRequest: SummaryLocalProtocolRequest {
    
    private let SUMMARY = "summary_codable_object"
    
    func getLocalSummaryData() -> SummaryModel? {
        let userDefaults = UserDefaults.standard
        guard let decoded  = userDefaults.object(forKey: SUMMARY) as? Data else {
            return nil
        }
        
        guard let summary = NSKeyedUnarchiver.unarchiveObject(with: decoded) as? SummaryModel else {
            return nil
        }
        
        return summary
    }
    
    func saveLocalSummary(data: SummaryModel) {
        let userDefaults = UserDefaults.standard
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: data)
        userDefaults.set(encodedData, forKey: SUMMARY)
        userDefaults.synchronize()
    }
    
}
