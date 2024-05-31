//
//  PostModel.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import Foundation
import SwiftUI

class Project: Codable, Identifiable{
    var id: String
    var author: String
    var name: String
    var summary: String
//    var photos: [Data]
    var tags: [String]
    var link: String
    var creation: Date
    
    init(id: String = UUID().uuidString, author: String = "Marzia Pirozzi", name: String, summary: String, /*photos: [Data],*/ tags: [String] = ["Unity", "Database", "Machine Learning", "Swift", "UI"], link:String = "google.com", creation: Date = Date.now) {
        self.id = id
        self.author = author
        self.name = name
        self.summary = summary
//        self.photos = photos
        self.tags = tags
        self.link=link
        self.creation = creation
    }
}
