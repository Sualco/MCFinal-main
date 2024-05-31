//
//  MCFinalApp.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import Firebase

@main
struct MCFinalApp: App {
    @State private var controller = Controller()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(controller)
        }
    }
}
