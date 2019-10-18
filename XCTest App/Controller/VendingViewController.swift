//
//  VendingViewController.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 26/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

class VendingViewController: UIViewController {

    var vendingModel:VendingViewModel?
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Vending"

        vendingModel = VendingViewModel()
    }
    
    
    @IBAction func vendOptionTapped(_ sender: UIButton) {
        
        var selected = ""
        switch sender.tag {
        case 0:selected = "Chips"
        case 1:selected = "Candy"
        case 2:selected = "Coke"
        default:
            selected = "Chips"
        }
        
        do {
            try vendingModel?.vend(item: selected)
            statusLabel.text = "Dispensing \(selected)"
        } catch VendingError.invalidSelection {
            statusLabel.text = "In valid Selection"
        } catch VendingError.outOfStock {
            statusLabel.text = "Out of stock"
        }
        catch {
            
        }
    }
    
}
