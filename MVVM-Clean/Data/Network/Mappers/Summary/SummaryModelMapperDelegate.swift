//
//  SummaryModelMapperDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 03/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol SummaryModelMapperDelegate {
    func mapToSummaryModel(summary: Summary) -> SummaryModel
    func mapToSummaryModelArray(summaries: [Summary]) -> [SummaryModel]
}
