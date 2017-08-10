//
//  ViewController.swift
//  MRSelectCountry
//
//  Created by Muhammad Raza on 09/08/2017.
//  Copyright © 2017 Muhammad Raza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MRSelectCountryDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MRSelectCountry", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "MRSelectCountryTableViewController") as! MRSelectCountryTableViewController
        controller.delegate = self
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func didSelectCountry(controller: MRSelectCountryTableViewController, country: Country) {
        print(country.description)
        controller.navigationController?.popViewController(animated: true)
    }

}

