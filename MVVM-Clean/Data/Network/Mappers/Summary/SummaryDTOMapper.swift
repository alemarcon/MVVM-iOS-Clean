//
//  SummaryDTOMapper.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

struct SummaryDTOMapper {
    
    /// Map a single Summary DTO object in a single SummaryModel object
    /// - Parameter summary: Summary DTO to map
    /// - Returns: SummaryModel mapped from DTO
    static func map(summary: SummaryDTO) -> Summary {
        var summaryModel = Summary()
        
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        
        var confirmed = SummaryConfirmed()
        
        if let newConfirmedCasesValue = summary.global?.newConfirmed {
            confirmed.newConfirmedCases = nf.string(from: NSNumber(value: newConfirmedCasesValue)) ?? "0"
//            summaryModel.newConfirmedCases = nf.string(from: NSNumber(value: newConfirmedCasesValue)) ?? "0"
        }
        
        if let confirmedTotalCasesValue = summary.global?.totalConfirmed {
            confirmed.totalConfirmedCases = nf.string(from: NSNumber(value: confirmedTotalCasesValue)) ?? "0"
//            summaryModel.totalConfirmedCases = nf.string(from: NSNumber(value: confirmedTotalCasesValue)) ?? "0"
        }
        
        summaryModel.summaryConfirmed = confirmed
        
        var death = SummaryDeath()
        
        if let newDeathValue = summary.global?.newDeaths {
            death.newDeath = nf.string(from: NSNumber(value: newDeathValue)) ?? "0"
//            summaryModel.newDeath = nf.string(from: NSNumber(value: newDeathValue)) ?? "0"
        }
        
        if let totalDeathsValue = summary.global?.totalDeaths {
            death.totalDeaths = nf.string(from: NSNumber(value: totalDeathsValue)) ?? "0"
//            summaryModel.totalDeaths = nf.string(from: NSNumber(value: totalDeathsValue)) ?? "0"
        }
        
        summaryModel.summaryDeath = death
        
        var recovered = SummaryRecovered()
        
        if let newRecoveredValue = summary.global?.newRecovered {
            recovered.newRecoveredCases = nf.string(from: NSNumber(value: newRecoveredValue)) ?? "0"
//            summaryModel.newRecoveredCases = nf.string(from: NSNumber(value: newRecoveredValue)) ?? "0"
        }
        
        if let totalRecoveredValue = summary.global?.totalRecovered {
            recovered.totalRecovered = nf.string(from: NSNumber(value: totalRecoveredValue)) ?? "0"
//            summaryModel.totalRecovered = nf.string(from: NSNumber(value: totalRecoveredValue)) ?? "0"
        }
        summaryModel.summaryRecovered = recovered
        
        return summaryModel
    }
    
    /// Map a Summary DTO object array in a SummaryModel object array
    /// - Parameter summaries: Summary DTO array to map
    /// - Returns: SummaryModel object array mapped from DTO
    static func map(array summaries: [SummaryDTO]) -> [Summary] {
        var summariesModel = [Summary]()
        
        summaries.forEach { (summary) in
            summariesModel.append( map(summary: summary) )
        }
        
        return summariesModel
    }
    
}
