//
//  CountryTableViewCell.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 06/10/2020.
//  Copyright © 2020 Alessandro Marcon. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "country_cell"
    static let XIB_NAME = "CountryCell"
    static let DEFAULT_HEIGHT: CGFloat = 221.0
    
    @IBOutlet var countryNameLabel: UILabel!
    @IBOutlet var newCasesLabel: UILabel!
    @IBOutlet var newRecoveredCasesLabel: UILabel!
    @IBOutlet var newDeathsCasesLabel: UILabel!
    @IBOutlet var totalCasesLabel: UILabel!
    @IBOutlet var totalRecoveredLabel: UILabel!
    @IBOutlet var totalDeathsCasesLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    override func prepareForReuse() {
        newCasesLabel.text = ""
        newRecoveredCasesLabel.text = ""
        newDeathsCasesLabel.text = ""
        totalCasesLabel.text = ""
        totalRecoveredLabel.text = ""
        totalDeathsCasesLabel.text = ""
    }
    
    func bind(country: CountryModel) {
        countryNameLabel.text = country.countryName
        
        let newCasesLocalized = NSLocalizedString("new_cases", comment: "")
        newCasesLabel.text = String.localizedStringWithFormat(newCasesLocalized, "\(country.newConfirmed)")
        
        let newRecoveredLocalized = NSLocalizedString("new_recovered", comment: "")
        newRecoveredCasesLabel.text = String.localizedStringWithFormat(newRecoveredLocalized, "\(country.newRecovered)")
        
        let newDeathLocalized = NSLocalizedString("new_deaths", comment: "")
        newDeathsCasesLabel.text = String.localizedStringWithFormat(newDeathLocalized, "\(country.newDeaths)")
        
        let totalCasesLocalized = NSLocalizedString("total_cases", comment: "")
        totalCasesLabel.text = String.localizedStringWithFormat(totalCasesLocalized, "\(country.totalConfirmed)")
        
        let totalRecoveredLocalized = NSLocalizedString("total_recovered", comment: "")
        totalRecoveredLabel.text = String.localizedStringWithFormat(totalRecoveredLocalized, "\(country.totalRecovered)")
        
        let totalDeathLocalized = NSLocalizedString("total_deaths", comment: "")
        totalDeathsCasesLabel.text = String.localizedStringWithFormat(totalDeathLocalized, "\(country.totalDeaths)")
        
        self.isUserInteractionEnabled = false
    }

}
