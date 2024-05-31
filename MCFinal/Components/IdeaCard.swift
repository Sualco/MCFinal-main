//
//  IdeaCard.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData

struct IdeaCard: View {
//    @Environment(\.modelContext) var modelContext
    var idea: Idea
//    @Query var requests: [Request]
    
    var body: some View {
        ZStack{
            LeafView()
                .frame(height: 350)
            VStack (alignment: .leading){
                
                HStack{
                    Image("pfp")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:80, height: 80)
                        .cornerRadius(50)
                        .padding(.trailing,10)
                    VStack(alignment:.leading){
                        Text(idea.author)
                            .bold()
                            .font(.title2)
                        Text("@mrzprz")
                    }//.padding(38)
                }//.padding()
                
                Text(idea.text)
                    .lineLimit(2, reservesSpace: true)
                
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
                    
                    
                }.scrollIndicators(.hidden)
                
                HStack {
                    Spacer()
                    Button(action: {
                        //                    let reqs: [Request] = [Request(user: User(name: "Giorgio Caiazzo", pfp: "feed2"), idea: idea), Request(user: User(name: "Marzia Pirozzi"), idea: idea)]
                        //                    modelContext.insert(reqs[0])
                        //                    modelContext.insert(reqs[1])
                    }, label: {
                        Image(systemName: "person.badge.plus")
                        
                            .foregroundStyle(.black)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.gray)
                                    .opacity(0.3)
                                .frame(width: 60, height: 40)}
                            .padding()
                        
                    }).padding()
                }.padding(.vertical, -5)
                //.padding(.horizontal, 19)
                
                
                
            }
            .padding(.horizontal, 25)
            //.background(.otherGray)
            .cornerRadius(10)
            .padding(.horizontal)
            //        .overlay{
            //            LeafView()
            //                .frame(height: 360)
            //        }
        }
    }
}


#Preview{
    IdeaCard(idea: Idea())
}
