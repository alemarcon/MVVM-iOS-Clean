//
//  MainViewController.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit
import Swinject

class SummaryViewController: BaseViewController {

    @IBOutlet var welcomeMessageLabel: UILabel!
    @IBOutlet var lastUpdateLabel: UILabel!
    @IBOutlet var newConfirmedCasesLabel: UILabel!
    @IBOutlet var newConfirmedCasesValueLabel: UILabel!
    @IBOutlet var totalCasesLabel: UILabel!
    @IBOutlet var totalCasesValueLabel: UILabel!
    @IBOutlet var newDeathsLabel: UILabel!
    @IBOutlet var newDeathValueLabel: UILabel!
    @IBOutlet var totalDeathsLabel: UILabel!
    @IBOutlet var totalDeathsValueLabel: UILabel!
    @IBOutlet var newRecoveredLabel: UILabel!
    @IBOutlet var newRecoveredValueLabel: UILabel!
    @IBOutlet var totalRecoveredLabel: UILabel!
    @IBOutlet var totalRecoveredValueLabel: UILabel!
    @IBOutlet var countriesButton: UIBarButtonItem!
    
    var sessionRepository: SessionRepositoryDelegate?
    var mainViewModel: SummaryCovidViewModelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localizeUI()
        bind()
    }
    
    private func localizeUI() {
        welcomeMessageLabel.text = NSLocalizedString("welcome_message", comment: "")
        let lastUpdate = NSLocalizedString("last_summary_update", comment: "")
        lastUpdateLabel.text = String.localizedStringWithFormat(lastUpdate, "...")
        
        newConfirmedCasesLabel.text = NSLocalizedString("new_confirmed_cases", comment: "")
        totalCasesLabel.text = NSLocalizedString("total_cases", comment: "")
        newDeathsLabel.text = NSLocalizedString("new_deaths_cases", comment: "")
        totalDeathsLabel.text = NSLocalizedString("total_deaths", comment: "")
        newRecoveredLabel.text = NSLocalizedString("new_recovered", comment: "")
        totalRecoveredLabel.text = NSLocalizedString("total_recovered", comment: "")
        
        countriesButton.title = NSLocalizedString("countries_label", comment: "")
    }
    
    private func bind() {
        
        mainViewModel?.status.bind(to: view) { [weak self] view, _ in
            if let viewModel = self?.mainViewModel {
                switch viewModel.status.value {
                case .none:
                    LOGD("No action")
                case .gettingSummaryData:
                    LOGD("Loading summary data")
                case.summaryDataSuccess:
                    LOGD("Summary data success")
                    if let summary = viewModel.summary {
                        self?.updateSummary(withData: summary)
                    }
                case .summaryDataError:
                    LOGD("Summary data error")
                    self?.showCancelAlert(title: "Error", message: viewModel.error?.localizedErrorMessage ?? "")
                }
            }
        }
        
        loadSummaryData()
    }
    
    private func updateSummary(withData: SummaryModel) {
        let lastUpdate = NSLocalizedString("last_summary_update", comment: "")
        lastUpdateLabel.text = String.localizedStringWithFormat(lastUpdate, "\(withData.lastUpdate)")

        if let confirmed = Int(withData.newConfirmedCases) {
            let nf = NumberFormatter()
            nf.numberStyle = .decimal
            
            newConfirmedCasesValueLabel.text = nf.string(from: NSNumber(integerLiteral: confirmed))
        }
        
//        newConfirmedCasesValueLabel.text = withData.newConfirmedCases
        totalCasesValueLabel.text = withData.totalConfirmedCases
        newDeathValueLabel.text = withData.newDeath
        totalDeathsValueLabel.text = withData.totalDeaths
        newRecoveredValueLabel.text = withData.newRecoveredCases
        totalRecoveredValueLabel.text = withData.totalRecovered
    }
    
    private func backToLoginViewController() {
        if let loginViewController = Assembler.sharedAssembler.resolver.resolve(LoginViewController.self) {
            let nvc: UINavigationController = UINavigationController(rootViewController: loginViewController)
            nvc.setNavigationBarHidden(true, animated: false)
            UIApplication.shared.keyWindow?.rootViewController = nvc
        }
    }
    
    @IBAction func refreshSummaryData(_ sender: UIBarButtonItem) {
        loadSummaryData()
    }
    
    private func loadSummaryData() {
        LOGD("Load summary data")
        mainViewModel?.summaryData()
    }
    
    @IBAction func showCountriesDataController(_ sender: UIBarButtonItem) {
        LOGD("Show countries data view controller")
        if let countriesViewController = Assembler.sharedAssembler.resolver.resolve(CountryListViewController.self) {
            self.navigationController?.pushViewController(countriesViewController, animated: true)
        }
    }
    
    
}
