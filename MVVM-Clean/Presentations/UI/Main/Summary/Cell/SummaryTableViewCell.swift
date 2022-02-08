//
//  SummaryTableViewCell.swift
//  MVVM-Clean
//
//  Created by Alessandro Marcon on 30/11/21.
//  Copyright © 2021 Alessandro Marcon. All rights reserved.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "summary_cell"
    static let XIB_NAME = "SummaryTableViewCell"
    static let DEFAULT_HEIGHT: CGFloat = 130.0

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var leftSectionTitle: UILabel!
    @IBOutlet weak var leftSectionData: UILabel!
    @IBOutlet weak var rightSectionTitle: UILabel!
    @IBOutlet weak var rightSectionData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        cellTitle.text = ""
        leftSectionTitle.text = ""
        leftSectionData.text = ""
        rightSectionTitle.text = ""
        rightSectionData.text = ""
    }
    
    func setupDeath(summary: SummaryDeath) {
        cellTitle.text = summary.title
        leftSectionTitle.text = NSLocalizedString("new", comment: "")
        leftSectionData.text = summary.newDeath
        
        rightSectionTitle.text = NSLocalizedString("total", comment: "")
        rightSectionData.text = summary.totalDeaths
    }
    
    func setupConfirmed(summary: SummaryConfirmed) {
        cellTitle.text = summary.title
        leftSectionTitle.text = NSLocalizedString("new", comment: "")
        leftSectionData.text = summary.newConfirmedCases
        
        rightSectionTitle.text = NSLocalizedString("total", comment: "")
        rightSectionData.text = summary.totalConfirmedCases
    }
    
    func setupConfirmed(summary: SummaryRecovered) {
        cellTitle.text = summary.title
        leftSectionTitle.text = NSLocalizedString("new", comment: "")
        leftSectionData.text = summary.newRecoveredCases
        
        rightSectionTitle.text = NSLocalizedString("total", comment: "")
        rightSectionData.text = summary.totalRecovered
    }
    
}
