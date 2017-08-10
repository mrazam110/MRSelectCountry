//
//  SelectCountryTableViewCell.swift
//  life
//
//  Created by Muhammad Raza on 14/04/2017.
//  Copyright © 2017 Muhammad Raza. All rights reserved.
//

import UIKit

class MRSelectCountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryLocaleLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
