//
//  RequestCard.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI

struct RequestCard: View {
    @Environment(Controller.self) private var controller
    var userId: String
    
    var body: some View {
        HStack{
            HStack {
                NavigationLink(destination: EmptyView()){
                    VStack{
                        
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .cornerRadius(50)
                            .aspectRatio(contentMode: .fit)
                        
                        Text(controller.userr.usename)
                            .font(.headline)
                    }
                }
                
                
                VStack{
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(5)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                            .padding(5)
                    })
                    
                    
                }.frame(width: 100, height: 100)
                
            }.padding(10)
                .foregroundStyle(.black)
                .background(.gray)
                .cornerRadius(10)
        }
    }
}


