//
//  CountryCovidViewModel.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Combine

//MARK: - CountryCovidViewModel Status
enum CountryCovidViewModelStatus {
    case none
    case gettingCountryData
    case countriesDataSuccess
    case countriesDataError
}

protocol CountryCovidViewModelDelegate: CountryCovidViewModelInputDelegate, CountryCovidViewModelOutputDelegate { }

class CountryCovidViewModel: CountryCovidViewModelDelegate {
    
    var countryAsyncUseCase: CountryUseCaseAsyncDelegate?
    var status: CurrentValueSubject<CountryCovidViewModelStatus, Never> = .init(.none)
    var error: CustomError?
    var countries: [Country]?
    
    func countryList() {
        status.value = .gettingCountryData
        Task {
            do {
                guard let countries = try await countryAsyncUseCase?.getCountryList() else {
                    self.error = CustomError.nilData
                    status.send(.countriesDataError)
                    return
                }
                self.countries = countries
                status.send(.countriesDataSuccess)
            } catch(let error) {
                self.error = error as? CustomError
                status.send(.countriesDataError)
            }
        }
    }
    
}
