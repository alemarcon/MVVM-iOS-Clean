//
//  CountryCovidViewModelOutputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Combine

protocol CountryCovidViewModelOutputDelegate {
    var status: CurrentValueSubject<CountryCovidViewModelStatus, Never> { get set }
    var error: CustomError? { get }
    var countries: [Country]? { get }
}
