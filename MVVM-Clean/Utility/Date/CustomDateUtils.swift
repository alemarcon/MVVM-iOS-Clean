//
//  CustomDateUtils.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class CustomDateUtils: NSObject {
    
    enum CustomDateUtilsFormat: String {
        case italianDateHourDateFormat = "dd-MM-yyyy HH:mm:ss.SSS"
    }
    
    /// Generate current timestamp
    ///
    /// - Returns: Return a string rapresent current time stamp dd-MM-yyyy HH:mm:ss.SSS
    public static func currentStringDate() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = CustomDateUtilsFormat.italianDateHourDateFormat.rawValue
        
        return formatter.string(from: Date())
    }
    
    /// Generate current timestamp returned in Date object
    /// - Returns: Return a date rapresent current time stamp dd-MM-yyyy HH:mm:ss.SSS
    public static func currentDate() -> Date {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = CustomDateUtilsFormat.italianDateHourDateFormat.rawValue
        
        let dateString = formatter.string(from: Date())
        return formatter.date(from: dateString)!
    }
    
    /// Get current verbose date in format dd VERBOSE MONTH yyyy (example: 10 March 2020) localized depending on device
    public static func currentVerboseDate() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "dd MMMM yyyy"
        
        return formatter.string(from: Date())
    }
    
    /// Check delta from last network data and the custom delta
    /// - Parameter lastUpdate: Last update received from network
    /// - Returns: TRUE if a new HTTP request is needed, FALSE otherwise
    public static func checkForNetworkUpdate(lastUpdate: String) -> Bool {
        
        var networkUpdateNeeded = true
        let actualCalendar = Calendar.current
        let currentDate = CustomDateUtils.currentDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let lastUpdateDate = formatter.date(from: lastUpdate) else {
            return true
        }

        let dataComponents = actualCalendar.dateComponents([.hour, .day], from: lastUpdateDate, to: currentDate)
        
        if( dataComponents.hour ?? 0 <= API.networkHoursDelta && dataComponents.day ?? 0 == 0 ) {
            LOGD("Local summary data was saved \(dataComponents.hour ?? 0) hours ago. Configured delta is \(API.networkHoursDelta) hours. No network call needed")
            networkUpdateNeeded = false
        } else {
            LOGD("Local summary data was saved \(dataComponents.day ?? 0) days and \(dataComponents.hour ?? 0) hours ago. Configured delta is \(API.networkHoursDelta) hours. New network call needed")
        }
        
        return networkUpdateNeeded
    }
}
