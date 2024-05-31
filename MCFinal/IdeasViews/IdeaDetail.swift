//
//  IdeaDetail.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI
import SwiftData

struct IdeaDetail: View {
    var idea: Idea
    @Environment(Controller.self) private var controller
    @State private var showReportModal = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                HStack{
                    Image("pfp")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:70, height: 70)
                        .cornerRadius(50)
                    VStack(alignment:.leading){
                        Text(idea.author)
                            .bold()
                            .font(.title2)
                        Text("@\(idea.author)")
                    }.padding(5)
                }.padding(.top)
                
                Text(idea.text)
                //.lineLimit(2, reservesSpace: true)
                
                Text("**Looking for:** \(idea.lookingFor)")
                    .padding(.vertical, 5)
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(idea.tags, id: \.self){ tag in
                            Text(tag)
                                .bold()
                                .padding(10)
                                .background(.myGray)
                                .cornerRadius(10)
                        }
                    }
                    
                    
                }
                
                Text("Requests:")
                    .bold()
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(controller.requests){request in
                            if(request.idea == idea.id){
                                RequestCard(userId: request.user)
                            }
                        }
                    }
                 
                }
                
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        
                        self.showReportModal.toggle()
                        
                        
                    }, label: {
                        Image(systemName: "exclamationmark.bubble")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .padding(10)
                            .foregroundStyle(.black)
                            .background(.myGray)
                            .cornerRadius(10)
                    })
                    .sheet(isPresented: $showReportModal){
                        EmptyView()
                    }
                    
                }.padding(.vertical)
                    .padding(.horizontal, 9)
                
                
                
            }
            .padding(.horizontal, 25)
            .background(.otherGray)
            .cornerRadius(10)
            .padding(.horizontal)
        }.onAppear{
            controller.getRequests()
        }
    }
}

#Preview{
    IdeaDetail(idea: Idea())
}
