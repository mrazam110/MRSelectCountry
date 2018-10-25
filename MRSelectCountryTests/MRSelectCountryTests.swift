//
//  MRSelectCountryTests.swift
//  MRSelectCountryTests
//
//  Created by Muhammad Raza on 09/08/2017.
//  Copyright © 2017 Muhammad Raza. All rights reserved.
//

import XCTest
@testable import MRSelectCountry

class MRSelectCountryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testControllerInitialzation() {
        
        let controller = MRSelectCountry.getMRSelectCountryController()
        XCTAssertNotNil(controller)
    }
    
    func testCountryJsonDataValidation() {
        let countries = MRSelectCountry.getCountries()
        
        let firstCountry = countries.first
        XCTAssertNotNil(firstCountry)
        
        let lastCountry = countries.last
        XCTAssertNotNil(lastCountry)
        
        XCTAssertTrue(firstCountry != lastCountry)
        
        // Validating Data of First Country in Array
        let comparingFirstCountry = MRCountry(json: ["name": "Afghanistan", "dial_code": "+93", "code": "AF"])
        XCTAssertEqual(comparingFirstCountry, firstCountry!)
        
        // Validating Data of Last Country in Array{
        let comparingLastCountry = MRCountry(json: ["name": "Zimbabwe", "dial_code": "+263", "code": "ZW"])
        XCTAssertEqual(comparingLastCountry, lastCountry!)
    }
    
    func testCountryCount() {
        let countries = MRSelectCountry.getCountries()
        XCTAssertTrue(countries.count == 241)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let _ = MRSelectCountry.getCountries()
        }
    }
    
}
