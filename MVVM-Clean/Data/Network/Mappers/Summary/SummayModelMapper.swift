//
//  SummayModelMapper.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

/**
 The implementation of SummaryModelMapperDelegate. Here we are going to map the Summary DTO field to SummaryModel. In this way we can map only the field we need.
 */
class SummayModelMapper: SummaryModelMapperDelegate {
    
    /// Map a single summary DTO object to a SummaryModel object
    /// - Parameter summary: Summary DTO object to map
    /// - Returns: SummaryModel mapped from Summary DTO
    func mapToSummaryModel(summary: Summary) -> SummaryModel {
        let summaryModel = SummaryModel()
        
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        
        if let newConfirmedCasesValue = summary.global?.newConfirmed {
            summaryModel.newConfirmedCases = nf.string(from: NSNumber(value: newConfirmedCasesValue)) ?? "0"
        }
        
        if let confirmedTotalCasesValue = summary.global?.totalConfirmed {
            summaryModel.totalConfirmedCases = nf.string(from: NSNumber(value: confirmedTotalCasesValue)) ?? "0"
        }
        
        if let newDeathValue = summary.global?.newDeaths {
            summaryModel.newDeath = nf.string(from: NSNumber(value: newDeathValue)) ?? "0"
        }
        
        if let totalDeathsValue = summary.global?.totalDeaths {
            summaryModel.totalDeaths = nf.string(from: NSNumber(value: totalDeathsValue)) ?? "0"
        }
        
        if let newRecoveredValue = summary.global?.newRecovered {
            summaryModel.newRecoveredCases = nf.string(from: NSNumber(value: newRecoveredValue)) ?? "0"
        }
        
        if let totalRecoveredValue = summary.global?.totalRecovered {
            summaryModel.totalRecovered = nf.string(from: NSNumber(value: totalRecoveredValue)) ?? "0"
        }
        
        return summaryModel
    }
    
    /// Map a summary DTO array object to a SummaryModel array object
    /// - Parameter summaries: <#summaries description#>
    /// - Returns: <#description#>
    func mapToSummaryModelArray(summaries: [Summary]) -> [SummaryModel] {
        var summariesModel = [SummaryModel]()
        
        summaries.forEach { (summary) in
            summariesModel.append( mapToSummaryModel(summary: summary) )
        }
        
        return summariesModel
    }
}
