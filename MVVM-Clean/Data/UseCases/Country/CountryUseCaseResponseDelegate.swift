//
//  CountryUseCaseResponseDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol CountryUseCaseResponseDelegate: AnyObject {
    
    /// Called on success received summary data
    /// - Parameter summary: Summary data model
    func onCountryDataReceived(countries: [CountryModel])
    
    /// Called on summary data failure event
    /// - Parameter error: CustomError object
    func onCountryDataFailure(error: CustomError)
}
