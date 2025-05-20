//
//  StringExt.swift
//  Pokemon
//
//  Created by Cleverson Fukuoka on 06/05/25.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: "", with: "+")
    }
    
    func removeSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        self.removeSpaces().lowercased()
    }
    
}
