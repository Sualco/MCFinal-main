//
//  IdeasView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData

struct IdeasView: View {

    @State var openModalNewIdea = false
    @State var openModalNewProject = false
    @State var search = ""
    @Environment(Controller.self) private var controller
    var hideNavBar = false
    var body: some View {

        NavigationStack {
            
            ScrollView{
                ForEach(controller.ideas){idea in
                    NavigationLink {
                       IdeaDetail(idea: idea)
                    } label: {
                            IdeaCard(idea: idea)
                    }
                }.padding(.vertical)
            }
            
            .navigationTitle("Eureka")
            .toolbar{
                ToolbarItem(placement:.topBarTrailing){
                    HStack{
                        
                        
                        Menu {
                            
                                Button(action: {
                                    openModalNewIdea = true
                                }, label: {
                                    HStack(){
                                        Text("Idea")
                                        Image(systemName: "lightbulb.min.fill")
                                        
                                    }
                                })
                            
                           
                                Button(action: {
                                    
                                    openModalNewProject = true
                                    
                                }, label: {
                                    HStack(){
                                        Text("Projects")
                                        Image(systemName: "note.text")
                                            
                                        
                                    }
                                })
                            
                        } label: {
                            Image (systemName: "plus")
                                
                        }
                        NavigationLink(destination: ChatContentView()){
                            Image(systemName: "tray")
                                
                        }
                        NavigationLink(destination: Text("Notifiche")){
                            Image(systemName: "bell")
                        }
                    }
                }
                
                
            }
//            .toolbar{
//                Button(action: {
//                    openModal=true
//                }, label: {
//                    Image(systemName: "plus")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundStyle(.black)
//                })
//            }
            .navigationBarHidden(hideNavBar)
            .searchable(text: $search)
        }
        .sheet(isPresented: $openModalNewIdea, content: {
            NewIdeaModal()
        })
        .sheet(isPresented: $openModalNewProject, content: {
            NewProjectModal()
        })
    }
}
