//
//  PlacesViewController.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController {

    @IBOutlet weak var placeTableView: UITableView!
    var viewModel : PlaceViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = "Places"
        
        self.viewModel = PlaceViewModel.init(with: DataFetcher())
        viewModel.loadPlaces(from: "PlacesList")
    }
}

extension PlacesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPlaces
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceCell
        let placeData = viewModel.placeOfIndex(index: indexPath.row)
        cell.configureCell(model: placeData)
        return cell
    }
    
}
