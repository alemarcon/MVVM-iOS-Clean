//
//  CountryCovidViewModelInputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation

protocol CountryCovidViewModelInputDelegate {
    
    var countryUseCase: CountryUseCaseDelegate? { get }
    
    /// Get COVID 19 country list data
    func getCountryList()
    
}
