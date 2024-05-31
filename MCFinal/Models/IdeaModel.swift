//
//  IdeaModel.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import Foundation
import SwiftUI

class Idea: Codable, Identifiable{
    var id: String
    var name: String
    var author: String
    var text: String
    var lookingFor: String
    var tags: [String]
    var isOpen: Bool
    
    init(id: String = UUID().uuidString, name: String = "Game", author: String = "Marzia Pirozzi", text: String = "Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo...", lookingFor: String = "Coders", tags: [String] = ["Unity", "Database", "Machine Learning", "Swift", "UI"], isOpen: Bool = true) {
        self.id = id
        self.name = name
        self.author = author
        self.text = text
        self.lookingFor = lookingFor
        self.tags = tags
        self.isOpen = isOpen
    }
}
