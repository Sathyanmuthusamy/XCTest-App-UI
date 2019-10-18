//
//  PlaceViewModel.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

class PlaceViewModel: NSObject {

    var fetcher : DataFetcher!
    var numberOfPlaces = 0
    
    var places : [Place] = [Place]() {
        didSet {
            numberOfPlaces = places.count
        }
    }
    
    
    init(with fetcher:DataFetcher) {
        self.fetcher = fetcher
    }
    
    func loadPlaces(from file:String) {
        
        self.fetcher.fetchPlaces(from: file) { [weak self] (places, status) in

            guard let placeList = places else {
                return
            }
            self?.places = placeList
        }
    }
    
    func placeOfIndex(index: Int) -> Place {
        return self.places[index]
    }
}


