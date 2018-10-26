//
//  MRCountry.swift
//  MRSelectCountry
//
//  Created by Muhammad Raza on 09/08/2017.
//  Copyright © 2017 Muhammad Raza. All rights reserved.
//

import UIKit

public struct MRCountry {

    private(set) var name: String
    private(set) var dialCode: String
    private(set) var code: String
    private(set) var locale: String?
    
    public init(json: [String: Any]) {
        self.name = json["name"] as! String
        self.dialCode = json["dial_code"] as! String
        self.code = json["code"] as! String
        self.locale = json["locale"] as? String
    }
}

extension MRCountry: Equatable {
    
    public static func == (lhs: MRCountry, rhs: MRCountry) -> Bool {
        return lhs.name == rhs.name
            && lhs.dialCode == rhs.dialCode
            && lhs.code == rhs.code
            && lhs.locale == rhs.locale
    }
}
