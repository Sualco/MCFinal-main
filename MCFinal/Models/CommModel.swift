//
//  CommModel.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import Foundation

class Community:Codable, Identifiable{
    var id: String
    var name: String
    var password: String
    var summary: String
    var isIn: Bool
    
    init(id: String = UUID().uuidString, name: String = "Apple Academy", password: String = "12345", summary: String="best place in the world", isIn: Bool = true) {
        self.id = id
        self.name = name
        self.password = password
        self.summary = summary
        self.isIn=isIn
    }
}
