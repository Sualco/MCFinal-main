//
//  Requests.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import Foundation

class Request: Codable, Identifiable{
    var id: String
    var user: String
    var idea: String
    var isAccepted: Bool
    
    init(id: String = UUID().uuidString, user: String = UUID().uuidString, idea: String = UUID().uuidString, isAccepted: Bool = true) {
        self.id = id
        self.user = user
        self.idea = idea
        self.isAccepted = isAccepted
    }
}
