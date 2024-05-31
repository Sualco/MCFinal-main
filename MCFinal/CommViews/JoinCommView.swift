//
//  JoinCommView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI
import SwiftData

struct JoinCommView: View {
    @State private var name = ""
    @State private var password = ""
//    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
//    @Query var communities: [Community]
    
    var body: some View {
        NavigationStack {
            Form{
                Section{
                    TextField("Name", text: $name)
                }
                
                Section{
                    SecureField("Password", text: $password)
                }
            }
                .navigationTitle("Join a Community")
                .toolbar{
                    Button(action: {
//                       let comm = communities.first { $0.name==name && $0.password==password
//                        }
//                        
//                        if((comm) != nil){
//                            comm?.isIn=true
//                        }else{
//                            //popup
//                            print("nome o pass della comm errati")
//                        }
                        
                        dismiss()
                    }) {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.black)
                    }
                }
        }
    }
}

#Preview {
    JoinCommView()
}
