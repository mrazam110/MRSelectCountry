# MRSelectCountry
Easy way to get country data which includes country name and dial code for iOS Developers

![License](https://img.shields.io/cocoapods/l/MRSelectCountry.svg) 
![Platform](https://img.shields.io/cocoapods/p/MRSelectCountry.svg)
![Version](https://img.shields.io/cocoapods/v/MRSelectCountry.svg)

## Screenshots

![Screenshot](https://github.com/mrazam110/MRSelectCountry/blob/master/screenshots/1.png) ![Screenshot](https://github.com/mrazam110/MRSelectCountry/blob/master/screenshots/2.png) ![Screenshot](https://github.com/mrazam110/MRSelectCountry/blob/master/screenshots/3.png)


## Requirements

* iOS 9.0+

## Installation

#### [CocoaPods](https://cocoapods.org/) (recommended)

````ruby
# For latest release in cocoapods
pod 'MRSelectCountry'
````

#### Without [CocoaPods](https://cocoapods.org/)

1. **Why not CocoaPods?**
2. Drag all files from **/MRSelectCountry/MRSelectCountry/** to your project, which contains *.json, .swift* and *.storyboard* files

## How to Use

````swift
    let controller = MRSelectCountry.getMRSelectCountryController(delegate: self)
    self.navigationController?.pushViewController(controller, animated: true)
````

### Delegate Method

You can use `MRSelectCountryDelegate` to get selected country
````swift
func didSelectCountry(controller: MRSelectCountryTableViewController, country: MRCountry) {
    // Get country data
    print(country.description)

    // Dismiss/Pop the MRSelectCountryTableViewController
    controller.navigationController?.popViewController(animated: true)
}
````

## Questions & Help

Use [Issues](https://github.com/mrazam110/MRSelectCounttry/issues) for that. Before asking a question, see if it has already been answered

## License

`MRSelectCountry` is released under [MIT License](https://github.com/mrazam110/MRSelectCounttry/blob/master/LICENSE)

*Please provide attribution, it is greatly appreciated*
