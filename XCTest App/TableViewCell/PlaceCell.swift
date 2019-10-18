//
//  PlaceCell.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(model: Place) {
        titleLabel.text = model.name
        addressLabel.text = model.address
    }

}
