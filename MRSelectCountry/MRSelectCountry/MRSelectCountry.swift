//
//  MRSelectCountry.swift
//  MRSelectCountry
//
//  Created by Muhammad Raza on 21/08/2017.
//  Copyright © 2017 Muhammad Raza. All rights reserved.
//

import UIKit

public class MRSelectCountry: NSObject {
    
    public static func getMRSelectCountryController(delegate: MRSelectCountryDelegate? = nil) -> MRSelectCountryTableViewController {
        let bundle = Bundle(identifier: "org.cocoapods.MRSelectCountry")
        let storyboard = UIStoryboard(name: "MRSelectCountry", bundle: bundle)
        let controller = storyboard.instantiateViewController(withIdentifier: "MRSelectCountryTableViewController") as! MRSelectCountryTableViewController
        controller.delegate = delegate
        
        return controller
    }
    
    public static func getCountries() -> [MRCountry] {
        var countries = [MRCountry]()
        let bundle = Bundle(identifier: "org.cocoapods.MRSelectCountry")
        if let path = bundle?.url(forResource: "countries", withExtension: "json") {
            
            do {
                let jsonData = try Data(contentsOf: path, options: .mappedIfSafe)
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? NSArray {
                        for arrData in jsonResult {
                            let country = MRCountry(json: arrData as! [String: Any])
                            countries.append(country)
                        }
                    }
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            } catch let error as NSError {
                print("Error: \(error)")
            }
        }
        return countries
    }
}
