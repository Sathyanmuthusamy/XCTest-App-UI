//
//  PlaceViewModelTest.swift
//  MVVMTTDTests
//
//  Created by Sathyan Muthusamy on 01/02/19.
//  Copyright © 2019 Cognizant. All rights reserved.
//

import XCTest

enum ParsingError: Error, Equatable {
    case someExpectedError
    case someUnexpectedError
    case associatedValueError(value: Int)
}
@testable import XCTest_App

class PlaceViewModelTest: XCTestCase {

    var viewModel = PlaceViewModel.init(with: DataFetcher())
    var mockViewModel = PlaceViewModel.init(with: DataFetcher())
    
    override func setUp() {
        viewModel.loadPlaces(from: "PlacesList")
        mockViewModel.loadPlaces(from: "MockPlacesList")
    }

    override func tearDown() {
        viewModel.places = [Place]()
    }

    func testPlacesCountMatching() {
        XCTAssertEqual(viewModel.numberOfPlaces, viewModel.places.count)
    }
    
    func testPlacesCountNotMatching() {
        XCTAssertNotEqual(3, mockViewModel.places.count)
    }
    
    func testPlacesNotEmpty() {
        XCTAssertNotNil(viewModel.places, "Contain Places")
        XCTAssertTrue(viewModel.numberOfPlaces > 0)
    }
    
    func testPlaceOfIndex() {
        XCTAssertNotNil(viewModel.placeOfIndex(index: 0))
    }
    
    func testSamePlaceOfIndex() {
        let dataAttributes: [String : Any] = ["name": "Star bucks", "address": "Bangalore"]
        viewModel.places.append(Place.init(data: dataAttributes))
        let place = viewModel.placeOfIndex(index: viewModel.numberOfPlaces-1)
        XCTAssertNotNil(place)
        XCTAssertEqual(place.name, "Star bucks")
        XCTAssertEqual(place.address, "Bangalore")

    }
    
    func testGreaterThan() {
        // Viewmodel is having 3 places
        let dataAttributes: [String : Any] = ["name": "Star bucks", "address": "Bangalore"]
        viewModel.places.append(Place.init(data: dataAttributes))
        XCTAssertGreaterThan(viewModel.places.count, 3)
    }
    
    func testGreaterThanAndEqual() {
        // Viewmodel is having 3 places
        let placeOne: [String : Any] = ["name": "Thick sake factory", "address": "Chennai"]
        viewModel.places.append(Place.init(data: placeOne))
        XCTAssertGreaterThanOrEqual(viewModel.places.count, 3)
        XCTAssertGreaterThanOrEqual(viewModel.places.count, 4)
    }
    
    func testLessThan() {
        // Viewmodel is having 3 places
        viewModel.places.remove(at: viewModel.places.count-1)
        XCTAssertLessThan(viewModel.places.count, 3, "Less places")
    }
    
    func testLessThanAndEqual() {
        // Viewmodel is having 3 places
        viewModel.places.remove(at: viewModel.places.count-1)
        XCTAssertLessThanOrEqual(viewModel.places.count, 3)
        XCTAssertLessThanOrEqual(viewModel.places.count, 2)
    }

    func testPlacesLoadingInterval() {
        // This is an example of a performance test case.
        self.measure {
             viewModel.loadPlaces(from: "PlacesList")
        }
    }

}

