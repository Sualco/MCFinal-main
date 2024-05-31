//
//  PersonalCardEditView.swift
//  MCFinal
//
//  Created by Claudio Borrelli on 30/05/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct PersonalCardEditView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var PersonalName: String = ""
    @State var PersonalSurname: String = ""
    @State var BasedIn: String = ""
    @State var PersonalPhoto: [UIImage] = []
    @State var SelectedPhoto: PhotosPickerItem?
    @State private var PersonalImage: UIImage?
    @State private var Suggestions = ["unity", "swift", "machine learning", "swift data"]
    
    
    
    var body: some View {
        ScrollView{
            
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
                
                ZStack(alignment:.topLeading){
                    
                    LeafView()
                    
                    VStack(alignment: .leading,spacing: 20){
                        Text("Name:")
                            .font(.title3)
                            .bold()
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 30)
                            .foregroundStyle(.myGray)
                            .overlay{
                                TextField("", text: $PersonalName)
                                    .padding()
                                    RoundedRectangle(cornerRadius: 25.0)
                                    .stroke()
                                    .frame(height: 30)
                            }
                        
                        
                        Text("Surname:")
                            .font(.title3)
                            .bold()
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 30)
                            .foregroundStyle(.myGray)
                            .overlay{
                                TextField("", text: $PersonalSurname)
                                    .padding()
                                RoundedRectangle(cornerRadius: 25.0)
                                .stroke()
                                .frame(height: 30)
                            }
                        
                        
                        ScrollView(.horizontal){
                            HStack {
                                ForEach(PersonalPhoto, id: \.self) { photo in
                                    Image(uiImage: photo)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(10)
                                        
                                }
                                
                                PhotosPicker(selection: $SelectedPhoto, matching: .images) {
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
                            .onChange(of: SelectedPhoto) { _ in
                                Task {
                                    if let data = try? await SelectedPhoto?.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        PersonalPhoto.append(uiImage)
                                    } else {
                                        print("Failed to load image")
                                    }
                                }
                            }
                        }.padding(.top, 40)
                            .scrollIndicators(.hidden)
                        
                            .padding(.bottom,30)
                        Text("Based in:")
                            .font(.title2)
                            .bold()
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 30)
                            .opacity(0.3)
                            .foregroundStyle(.myGray)
                            .overlay{
                                TextField("", text: $BasedIn)
                                    .padding()
                                RoundedRectangle(cornerRadius: 25.0)
                                .stroke()
                                .frame(height: 30)
                            }
                        
                        Text("Favourite Song:")
                            .font(.title2)
                            .bold()
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 30)
                            .opacity(0.3)
                            .foregroundStyle(.myGray)
                            .overlay{
                                RoundedRectangle(cornerRadius: 25.0)
                                .stroke()
                                .frame(height: 30)
                            }
                        
                        Spacer()
                        Section{
                            
                            
                            
                            Button(action: {
                                
                            }, label: {
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundStyle(.myGray)
                                    .frame(height: 50)
                                    .opacity(0.3)
                                    .overlay{
                                        Text("Create")
                                            .foregroundStyle(.black)
                                        RoundedRectangle(cornerRadius: 25.0)
                                        .stroke()
                                        .frame(height: 30)
                                    }
                            }).disabled(PersonalName.isEmpty || PersonalSurname.isEmpty || BasedIn.isEmpty)
                        }
                        
                        
                    }.padding(40)
                    
                    
                }
            }.scrollIndicators(.hidden)
        }
    }


#Preview {
    PersonalCardEditView()
}
