//
//  MRSelectCountryTableViewController.swift
//  MRSelectCountry
//
//  Created by Muhammad Raza on 09/08/2017.
//  Copyright © 2017 Muhammad Raza. All rights reserved.
//

import UIKit

public class MRSelectCountryTableViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate {
    
    // MARK :- IBOutlets
    
    // MARK :- Properties
    
    private(set) var countries: [MRCountry] = []
    private var filteredCountries: [MRCountry] = []
    public weak var delegate: MRSelectCountryDelegate? = nil
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - UIViewController Lifecycle methods
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get Countries
        countries = MRSelectCountry.getCountries()
        
        // Remove extra seperator lines
        tableView.tableFooterView = UIView(frame: .zero)
        
        // Setup Search controller
        setupSearchController()
    }
    
    // MARK: - Supporting functions
    
    private func setupSearchController() {
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        searchController.delegate = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = true
        
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
            searchController.dimsBackgroundDuringPresentation = false // default is YES
            navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
            tableView.tableHeaderView = searchController.searchBar
        }
        definesPresentationContext = true
    }
    
    // MARK: - IBActions
    
    
    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering() {
            return filteredCountries.count
        }
        return countries.count
    }

    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MRSelectCountryTableViewCell
        
        // Configure the cell...
        var country: MRCountry
        if isFiltering() {
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
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedCountry: MRCountry!
        if isFiltering() {
            selectedCountry = filteredCountries[indexPath.row]
        }else{
            selectedCountry = countries[indexPath.row]
        }
        
        self.delegate?.didSelectCountry(controller: self, country: selectedCountry)
    }
    
    // MARK: - UISearchController
    
    public func updateSearchResults(for searchController: UISearchController) {
        filterCountry(text: searchController.searchBar.text!)
    }
    
    private func filterCountry(text: String) {
        filteredCountries = self.countries.filter({ (country) -> Bool in
            return country.name.lowercased().contains(text.lowercased()) || country.code.lowercased().contains(text.lowercased()) || country.dialCode.lowercased().contains(text.lowercased())
        })
        tableView.reloadData()
    }
    
    private func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private func isFiltering() -> Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty() || searchBarScopeIsFiltering)
    }

}
