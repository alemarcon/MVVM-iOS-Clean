//
//  SummaryDataRequestTest.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 20/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

class SummaryDataRequestTest: SummaryNetworkProtocolRequest {
    
    func getSummaryData<T>(success: @escaping (T) -> Void, failure: @escaping ((CustomError) -> Void)) where T : Decodable {
        
        let filePath = Bundle.main.path(forResource: "summary_data", ofType: "json")!
        let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
        
        let decoder: JSONDecoder = JSONDecoder.init()
        let summary: SummaryDTO = try! decoder.decode(SummaryDTO.self, from: data)
        success(summary as! T)
    }
    
}
