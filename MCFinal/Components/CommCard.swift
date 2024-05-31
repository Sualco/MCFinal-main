//
//  CommCard.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI

struct CommCard: View {
    
    var comm: Community
    
    var body: some View {
        VStack{
            Text(comm.name)
                .bold()
                .font(.title)
            
            Text(comm.summary)
                .lineLimit(2, reservesSpace: true)
            
                
        }.padding()
        .frame(maxWidth: .infinity)
        .background(.otherGray)
        .cornerRadius(10)
        .padding(.horizontal, 15)
    }
}
