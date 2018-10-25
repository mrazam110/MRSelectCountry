//
//  MRCountry.swift
//  MRSelectCountry
//
//  Created by Muhammad Raza on 09/08/2017.
//  Copyright © 2017 Muhammad Raza. All rights reserved.
//

import UIKit

public class MRCountry: NSObject {

    public var name: String
    public var dialCode: String
    public var code: String
    public var locale: String?
    
    init(json: [String: Any]){
        self.name = json["name"] as! String
        self.dialCode = json["dial_code"] as! String
        self.code = json["code"] as! String
        self.locale = json["locale"] as? String
        
        super.init()
    }
    
    override public var description: String {
        return "name = \(name)\ndial code = \(dialCode)\ncode = \(code)\nlocale = \(String(describing: locale))"
    }
    
}
