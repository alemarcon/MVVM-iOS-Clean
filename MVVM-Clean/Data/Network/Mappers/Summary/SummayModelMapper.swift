//
//  SummayModelMapper.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummayModelMapper: SummaryModelMapperDelegate {
    
    /// Map a single summary DTO object to a SummaryModel object
    /// - Parameter summary: Summary DTO object to map
    /// - Returns: SummaryModel mapped from Summary DTO
    func mapToSummaryModel(summary: Summary) -> SummaryModel {
        let summaryModel = SummaryModel()
        
        if let newConfirmedCasesValue = summary.global?.newConfirmed {
            summaryModel.newConfirmedCases = String(newConfirmedCasesValue)
        }
        
        if let confirmedTotalCasesValue = summary.global?.totalConfirmed {
            summaryModel.totalConfirmedCases = String(confirmedTotalCasesValue)
        }
        
        if let newDeathValue = summary.global?.newDeaths {
            summaryModel.newDeath = String(newDeathValue)
        }
        
        if let totalDeathsValue = summary.global?.totalDeaths {
            summaryModel.totalDeaths = String(totalDeathsValue)
        }
        
        if let newRecoveredValue = summary.global?.newRecovered {
            summaryModel.newRecoveredCases = String(newRecoveredValue)
        }
        
        if let totalRecoveredValue = summary.global?.totalRecovered {
            summaryModel.totalRecovered = String(totalRecoveredValue)
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
