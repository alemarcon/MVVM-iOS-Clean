//
//  MainViewController.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 04/08/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit
import Swinject
import Combine

class SummaryViewController: BaseViewController {

    @IBOutlet var welcomeMessageLabel: UILabel!
    @IBOutlet var lastUpdateLabel: UILabel!
    @IBOutlet weak var summaryTableView: UITableView!
    
    @IBOutlet var countriesButton: UIBarButtonItem!
    
    var mainViewModel: SummaryCovidViewModelDelegate?
    var subscriptions: Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localizeUI()
        summaryTableView.register(UINib(nibName: SummaryTableViewCell.XIB_NAME, bundle: nil), forCellReuseIdentifier: SummaryTableViewCell.IDENTIFIER)
        summaryTableView.dataSource = self
        bind()
    }
    
    private func localizeUI() {
        welcomeMessageLabel.text = NSLocalizedString("welcome_message", comment: "")
        let lastUpdate = NSLocalizedString("last_summary_update", comment: "")
        lastUpdateLabel.text = String.localizedStringWithFormat(lastUpdate, "...")
        countriesButton.title = NSLocalizedString("countries_label", comment: "")
    }
    
    private func bind() {
        
        mainViewModel?.status.sink { state in
            switch state {
            case .none:
                LOGD("No action")
            case .gettingSummaryData:
                LOGD("Loading summary data")
            case.summaryDataSuccess:
                LOGD("Summary data success")
                if let summary = self.mainViewModel?.summary {
                    self.updateSummary(withData: summary)
                }
            case .summaryDataError:
                LOGD("Summary data error")
                self.showCancelAlert(title: "Error", message: self.mainViewModel?.error?.errorDescription ?? "")
            }
        }.store(in: &subscriptions)

        loadSummaryData()
    }
    
    private func updateSummary(withData: Summary) {
        let lastUpdate = NSLocalizedString("last_summary_update", comment: "")
        DispatchQueue.main.async {
            self.lastUpdateLabel.text = String.localizedStringWithFormat(lastUpdate, "\(withData.lastUpdate)")
            self.summaryTableView.reloadData()
        }
    }
    
    @IBAction func showProfileViewController(_ sender: UIBarButtonItem) {
        if let profileViewController = Assembler.sharedAssembler.resolver.resolve(ProfileViewController.self) {
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
    
    private func loadSummaryData() {
        LOGD("Load summary data")
        mainViewModel?.summaryDataAsync()
    }
    
    @IBAction func showCountriesDataController(_ sender: UIBarButtonItem) {
        LOGD("Show countries data view controller")
        if let countriesViewController = Assembler.sharedAssembler.resolver.resolve(CountryListViewController.self) {
            self.navigationController?.pushViewController(countriesViewController, animated: true)
        }
    }
    
    
}

extension SummaryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainViewModel == nil ? 0 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = summaryTableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.IDENTIFIER, for: indexPath) as? SummaryTableViewCell {
            if( indexPath.row == 0 ) {
                if let confirmed = mainViewModel?.summary?.summaryConfirmed {
                    cell.setupConfirmed(summary: confirmed)
                    return cell
                } else {
                    return UITableViewCell()
                }
            } else if( indexPath.row == 1 ) {
                if let recovery = mainViewModel?.summary?.summaryRecovered {
                    cell.setupConfirmed(summary: recovery)
                    return cell
                } else {
                    return UITableViewCell()
                }
            } else if( indexPath.row == 2 ) {
                if let death = mainViewModel?.summary?.summaryDeath {
                    cell.setupDeath(summary: death)
                    return cell
                } else {
                    return UITableViewCell()
                }
            } else {
                return UITableViewCell()
            }
            
        } else {
            return UITableViewCell()
        }
    }
    
    
}
