//
//  CommunitiesView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI
import SwiftData

struct CommunitiesView: View {
    
//    @Environment(\.modelContext) var modelContext
//    @Query var communities: [Community]
    @Environment(Controller.self) private var controller
    @State private var joinComm=false
    @State private var newComm=false
    
    var body: some View {
        NavigationStack {
            ScrollView{
            if !controller.communities.isEmpty{
                VStack{
                    
                    Text("Join ")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    + Text("a community")
                        .font(.title3)
                        .foregroundColor(.gray)
                    + Text(" \nor")
                        .font(.title3)
                        .foregroundColor(.gray)
                    + Text("\ncreate ")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    + Text("a new one.")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                }.padding(.top,220)
            } else {
               
                    
                    
                    ForEach(controller.communities){community in
                        if(community.isIn==true){
                            CommCard(comm: community)
                        }
                    }
                }
                
            }.navigationTitle("Communities")
                .toolbar{
                    HStack{
                        Button(action: {
                            joinComm=true
                        }, label: {
                            Image(systemName: "link")
                                .foregroundStyle(.black)
                        })
                        
                        
                        Button(action: {
                            newComm=true
                        }, label: {
                            Image(systemName: "person.badge.plus")
                                .foregroundStyle(.black)
                        })

                    }
                }
            
            
            
                
        }.sheet(isPresented: $joinComm, content: {
            JoinCommView()
        })
        
        .sheet(isPresented: $newComm, content: {
            NewCommView()
        })
    }
}


#Preview {
    CommunitiesView()
}
