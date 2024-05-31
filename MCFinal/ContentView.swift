//
//  ContentView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) var modelContext
    //save user's name
    @Environment(Controller.self) private var controller
    @State private var img: Image = Image("pfp")
    
    var body: some View {
        TabView {
            
            IdeasView()
                .tabItem {Label("", systemImage: "lightbulb.2")}
                .labelsHidden()
            
            ProjectsView()
                .tabItem {Label("", systemImage: "network")}
                .labelsHidden()
            
            CommunitiesView()
                .tabItem {Label("", systemImage: "person.3")}
                .labelsHidden()
            
            ProfileView()
                .tabItem {
                    Label {
                        Text("")
                    } icon: {
                        ScaledImage(name: "pfp", size: CGSize(width: 24, height: 24))
                    }
                }
                .labelsHidden()
        }.onAppear(perform: {
            do {
                controller.getProjects()
                controller.getUser()
                controller.getIdeas()
                controller.getRequests()
                controller.getTags()
                controller.getCommunities()
//                                try modelContext.delete(model: Idea.self)
//                                try modelContext.delete(model: Project.self)
//                                try modelContext.delete(model: Community.self)
//                                try modelContext.delete(model: Request.self)
//                                try modelContext.delete(model: User.self)
            } catch {
                print("Failed to clear")
            }
        })
    }
}

struct ScaledImage: View {
    let name: String
    let size: CGSize
    
    var body: Image {
        let uiImage = resizedImage(named: self.name, for: self.size) ?? UIImage()
        
        return Image(uiImage: uiImage.withRenderingMode(.alwaysOriginal))
    }
    
    func resizedImage(named: String, for size: CGSize) -> UIImage? {
        guard let image = UIImage(named: named) else {
            return nil
        }
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
