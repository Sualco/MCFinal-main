//
//  UserModel.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import Foundation

class User: Codable, Identifiable{
    var id: String
    var name: String
    var usename: String
    var ruolo: String
    var pfp: String
    
    init(id: String = UUID().uuidString, name: String = "Marzia Pirozzi", usename: String = "mrzprz", ruolo: String = "coder", pfp: String = "pfp") {
        self.id = id
        self.name = name
        self.usename = usename
        self.ruolo = ruolo
        self.pfp = pfp
    }
}
