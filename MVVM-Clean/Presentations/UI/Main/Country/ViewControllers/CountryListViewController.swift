//
//  CountryListViewController.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {

    @IBOutlet var countryTableView: UITableView!
    
    var countryViewModel: CountryCovidViewModelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTableView.dataSource = self
        countryTableView.delegate = self
        
        countryTableView.register(UINib(nibName: CountryTableViewCell.XIB_NAME, bundle: nil), forCellReuseIdentifier: CountryTableViewCell.IDENTIFIER)
        
        bind()
    }
    
    /// Bind view model with view
    private func bind() {
        
        countryViewModel?.status.bind(to: view) { [weak self] view, _ in
            if let viewModel = self?.countryViewModel {
                switch viewModel.status.value {
                case .none:
                    LOGD("No action")
                case .gettingCountryData:
                    LOGD("Loading country data")
                case .countriesDataSuccess:
                    LOGD("Country data success")
                    self?.countryTableView.reloadData()
                case .countriesDataError:
                    LOGD("Country data error")
                    self?.showCancelAlert(title: "Error", message: viewModel.error?.localizedErrorMessage ?? "")
                }
            }
        }
        
        loadCountryListData()
    }
    
    
    /// Load country list data
    private func loadCountryListData() {
        countryViewModel?.getCountryList()
    }
}

//MARK: - UITableView datasource
extension CountryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LOGP("Found \(countryViewModel?.countries?.count ?? 0) countries")
        return countryViewModel?.countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.IDENTIFIER, for: indexPath) as? CountryTableViewCell {
            guard let viewModel = countryViewModel, let country = viewModel.countries?[indexPath.row] else {
                return UITableViewCell()
            }
            cell.bind(country: country)
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        LOGP("Selected cell at index \(indexPath.row). Do something with selected cell")
    }
}

//MARK: - UITableView delegate
extension CountryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CountryTableViewCell.DEFAULT_HEIGHT
    }

}
