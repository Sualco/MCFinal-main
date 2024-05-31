//
//  OptionsMenuView.swift
//  MCFinal
//
//  Created by Claudio Borrelli on 29/05/24.
//

import SwiftUI

struct OptionsMenuView: View {
    var body: some View {
        NavigationStack{
            List() {
                Section(){
                    Button(action: {
                        
                    }, label: {
                        HStack{
                            Image(systemName: "dollarsign.circle")
                            Text("Support Us!")
                        }
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            Image(systemName: "exclamationmark.bubble")
                            Text("Report a Problem")
                        }
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack{
                            Image(systemName: "minus.circle")
                            Text("Delete Account")
                        }.foregroundStyle(.red)
                    })
                }
                Section("info"){
                    Button(action: {
                        
                    }, label: {
                        HStack{
                            Image(systemName: "book.pages")
                            Text("Terms & Conditions")
                        }
                    })
                    Button(action: {
                        
                    }, label: {
                        HStack{
                            Image(systemName: "eye")
                            Text("Privacy")
                        }
                    })
                }
            }.listStyle(.insetGrouped)
        }
            
    }
}

#Preview {
    OptionsMenuView()
}
