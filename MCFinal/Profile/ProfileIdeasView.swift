//
//  ProfileIdeasView.swift
//  MCFinal
//
//  Created by Claudio Borrelli on 29/05/24.
//

import SwiftUI

struct ProfileIdeasView: View {
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
                                .padding()
                        
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
        
    }
}




#Preview {
    ProfileIdeasView()
}
