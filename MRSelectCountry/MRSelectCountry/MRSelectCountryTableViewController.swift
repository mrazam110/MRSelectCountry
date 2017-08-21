//
//  MRSelectCountryTableViewController.swift
//  MRSelectCountry
//
//  Created by Muhammad Raza on 09/08/2017.
//  Copyright © 2017 Muhammad Raza. All rights reserved.
//

import UIKit

let MRSELECTCOUNTRYCONTROLLER_IDENTIFIER = "MRSelectCountryTableViewController"
let STORYBOARD_NAME = "MRSelectCountry"

class MRSelectCountryTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK :- IBOutlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK :- Properties
    
    private var countries: [MRCountry] = []
    private var filteredCountries: [MRCountry] = []
    private var isFiltering = false
    public var delegate: MRSelectCountryDelegate?
    
    // MARK: - UIViewController Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get Countries
        countries = getCountries()
        
        // Remove extra seperator lines
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Supporting functions
    
    private func getCountries() -> [MRCountry] {
        var countries = [MRCountry]()
        if let path = Bundle.main.url(forResource: "countries", withExtension: "json") {
            
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
    
    // MARK: - IBActions
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering {
            return filteredCountries.count
        }
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MRSelectCountryTableViewCell
        
        // Configure the cell...
        var country: MRCountry
        if isFiltering {
            country = filteredCountries[indexPath.row]
        }else{
            country = countries[indexPath.row]
        }
        
        cell.countryNameLabel.text = country.name
        cell.codeLabel.text = country.dialCode
        cell.countryCodeLabel.text = country.code
        cell.countryLocaleLabel.text = country.locale
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedCountry: MRCountry!
        if isFiltering {
            selectedCountry = filteredCountries[indexPath.row]
        }else{
            selectedCountry = countries[indexPath.row]
        }
        
        self.delegate?.didSelectCountry(controller: self, country: selectedCountry)
    }
    
    // MARK :- UISearchBar Delegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != nil && self.searchBar.text != "" {
            isFiltering = true
            filterCountry(text: searchBar.text!)
        }else{
            isFiltering = false
            tableView.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text! != "" {
            isFiltering = true
            filterCountry(text: searchBar.text!)
        }else{
            isFiltering = false
            tableView.reloadData()
        }
    }
    
    private func filterCountry(text: String) {
        filteredCountries = self.countries.filter({ (country) -> Bool in
            return country.name.lowercased().contains(text.lowercased()) || country.code.lowercased().contains(text.lowercased()) || country.dialCode.lowercased().contains(text.lowercased())
        })
        tableView.reloadData()
    }

}
