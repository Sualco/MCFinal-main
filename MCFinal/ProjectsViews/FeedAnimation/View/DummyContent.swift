//
//  DummyContent.swift
//  MCFinal
//
//  Created by Claudio Borrelli on 31/05/24.
//

import SwiftUI

struct DummyContent: View {
    
    
    
    var body: some View {
        VStack (alignment: .leading) {
            Text ("Social Media")
                .font(.title2)
                .fontDesign(.monospaced)
                .bold()
                .padding(.vertical)
            Text ("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.")
            
                ScrollView(.horizontal){
                    HStack{
                        Image ("Pic 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Image ("Pic 1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }.frame(width: 600)
                }.scrollIndicators(.hidden)
            
                
            Text(" Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?")
             
            
            
        } .padding()
    }
}

#Preview {
    DummyContent()
}
