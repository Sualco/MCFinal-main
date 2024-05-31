//
//  NewProjectModal.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 17/05/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct PersonalView: View {
//    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State var name = ""
    @State var surname = ""
    @State var based = ""
    @State var photos: [UIImage] = []
    @State var selectedPhoto: PhotosPickerItem?
    @State private var photoImage: UIImage?
    
    @State private var suggestions = ["unity", "swift", "machine learning", "swift data"]
    
    @State var tagss: [String] = []
    
    var body: some View {
        
        
            
            HStack {
                Spacer()
                Button(action: {
                    /*let project = Project(name: title, summary: summary, photos: photos.map { $0.pngData()! }, tags: tagss)
                     modelContext.insert(project)*/
                    dismiss()
                }) {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                }.padding(.horizontal, 20)
                
                
                
            }
            
            Form{
                Section {
                    TextField("Name", text: $name)
                }
                Section {
                    TextField("Surname", text: $surname)
                }
                
                Section("Preview") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(photos, id: \.self) { photo in
                                Image(uiImage: photo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(10)
                            }
                            
                            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                                Image(systemName: "plus")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .padding(50)
                                    .foregroundStyle(.black)
                                    .background(.myGray)
                                    .cornerRadius(10)
                            }
                        }
                        .onChange(of: selectedPhoto) { _ in
                            Task {
                                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    photos.append(uiImage)
                                } else {
                                    print("Failed to load image")
                                }
                            }
                        }
                    }
                }
                
                Section {
                    TextField("Based In", text: $based)
                }
                
                Section {
                    TextField("Favourite song", text: $based)
                }
                
            }
        
        
    }
}

#Preview {
    PersonalView()
}
