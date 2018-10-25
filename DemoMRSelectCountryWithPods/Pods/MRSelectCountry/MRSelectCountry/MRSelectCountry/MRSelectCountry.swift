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
    
}
