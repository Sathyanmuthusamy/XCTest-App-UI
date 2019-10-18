//
//  DataFetcher.swift
//  XCTest App
//
//  Created by Sathyan Muthusamy on 25/06/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import UIKit

class DataFetcher: NSObject {

    func fetchPlaces(from jsonFile:String, completion: ([Place]?,_ errorMessage: String?)->()) {
        guard let path = Bundle.main.path(forResource: jsonFile, ofType: "json") else {
            completion(nil, "Problem in fetching places.")
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            guard let jsonResult = json as? [String: Any] else {
                completion(nil, "Problem in fetching places.")
                return
            }
            guard let results = jsonResult["results"] as? [[String: Any]] else { return }
            completion(self.placesListFrom(results: results), nil)
            
        } catch {
            completion(nil, "Problem in fetching places.")
        }
    }
    
    private func placesListFrom(results: [[String: Any]]) -> [Place] {
        var places = [Place]()
        for place in results {
            places.append(Place(data: place))
        }
        return places
    }
    
}
