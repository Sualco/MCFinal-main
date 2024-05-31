//
//  NewIdeaModal.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData



struct NewIdeaModal: View {
   // @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State var title = ""
    @State var summary = ""
    @State var role = ""
    @State var tags = ""
    @State var input = ""
    @State var popoverOn = false
    @State var filtered: [String] = []
    
    @State private var suggestions = ["unity", "swift", "machine learning", "swift data"]
    
    @State var tagss: [String] = []
    
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    TextField("Title", text: $title)
                }
                
                Section {
                    TextField("Description", text: $summary, axis: .vertical)
                        .lineLimit(5, reservesSpace: true)
                }
                List {
                    Picker("Role you're looking for", selection: $role) {
                         Text("Coder")
                            .tag("Coder")
                         Text("Designer")
                            .tag("Designer")
                    }
                }
                

                Section {
                    TextField("Tags", text: $input)
                    
                        .onChange(of: input, {
                            filtered = suggestions.filter { $0.lowercased().contains(input.lowercased()) }

                            if(filtered.isEmpty){
                                popoverOn=false
                            }else{
                                popoverOn=true
                            }
                        })
                        .onSubmit {
                            if(filtered.isEmpty){
                                suggestions.append(input)
                            }
                            
                            if(!tagss.contains(input)){
                                tagss.append(input)
                            }
                            
                            
                        }
                    
                        .popover(isPresented: $popoverOn,
                                 attachmentAnchor: .point(.center),
                                 content: {
                            HStack {
                                ForEach(filtered, id: \.self) {suggestion in
                                    Button(action: {
                                        input=suggestion
                                        popoverOn=false
                                    }, label: {
                                        Text(suggestion)
                                    })
                                    
                                }
                            }
                            .presentationCompactAdaptation((.popover))
                    })
                }
                
                if(!tagss.isEmpty){
                    Section{
                        HStack{
                            ForEach(tagss, id:\.self){tag in
                                Text(tag)
                                    .bold()
                                    .padding(10)
                                    .background(.myGray)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }

            }
            .toolbar{
                Button(action: {
                    
//                    let idea = Idea(name: title, text: summary, lookingFor: role, tags: tagss, isOpen: true)
//                    modelContext.insert(idea)
                    dismiss()
                    
                    
                }, label: {
                    Image(systemName: "checkmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.black)
                    
                })
            }
            .navigationTitle("New Idea")
        }
    }
}

#Preview {
    NewIdeaModal()
}
