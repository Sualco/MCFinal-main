//
//  JoinCommView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import SwiftUI
import SwiftData

struct NewCommView: View {
    @State private var name = ""
    @State private var password = ""
    @State private var summary = ""
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
                
                Section {
                    TextField("Description", text: $summary, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
            }
                .navigationTitle("New Community")
                .toolbar{
                    Button(action: {
//                        let comm = Community(name: name, password: password, summary: summary)
//                        modelContext.insert(comm)
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
    NewCommView()
}
