//
//  CountryCovidViewModelOutputDelegate.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import Foundation
import Bond

protocol CountryCovidViewModelOutputDelegate {
    var status: Observable<CountryCovidViewModelStatus> { get }
    var error: CustomError? { get }
    var countries: [CountryModel]? { get set }
}
