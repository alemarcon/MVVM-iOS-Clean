//
//  CountryCovidViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

//MARK: - CountryCovidViewModel Status
enum CountryCovidViewModelStatus {
    case none
    case gettingCountryData
    case countriesDataSuccess
    case countriesDataError
}

protocol CountryCovidViewModelDelegate: CountryCovidViewModelInputDelegate, CountryCovidViewModelOutputDelegate { }

class CountryCovidViewModel: CountryCovidViewModelDelegate {
    
    var countryUseCase: CountryUseCaseDelegate?
    var status: Observable<CountryCovidViewModelStatus> = Observable(.none)
    var error: CustomError?
    var countries: [Country]?
    
    func getCountryList() {
        LOGI("Begin recover country list data")
        status.value = .gettingCountryData
        countryUseCase?.getCountryList()
    }
    
}

extension CountryCovidViewModel: CountryUseCaseResponseDelegate {
    
    func onCountryDataReceived(countries: [Country]) {
        LOGI("Country data received")
        self.countries = countries
        status.value = .countriesDataSuccess
    }
    
    func onCountryDataFailure(error: CustomError) {
        LOGI("Country data received")
        self.countries = nil
        self.error = error
        status.value = .countriesDataError
    }

}
