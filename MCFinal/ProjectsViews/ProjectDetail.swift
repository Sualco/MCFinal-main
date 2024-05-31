//
//  ProjectDetail.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 20/05/24.
//

import SwiftUI

struct ProjectDetail: View {
    
    @State private var images: [String] = ["feed1","feed2","feed5","feed4","feed3", ]
    
    //TODO: like and comments
    
    var project: Project
    @State private var isLiked = false
    @State private var openComments = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack{
                        VStack{
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(images, id:\.self){image in
                                        
                                        //                                        let uiImage = UIImage(data: image)
                                        
                                        //                                        Image(uiImage: uiImage!)
                                        Image(image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                                            .scrollTransition { content, phase in
                                                content.opacity(phase.isIdentity ? 1:0.5)
                                            }
                                    }
                                }.scrollTargetLayout()
                                
                            }
                            .contentMargins(1, for: .scrollContent)
                            .scrollTargetBehavior(.viewAligned)
                            
                        }
                        VStack{
                            Spacer()
                            HStack{
                                Button(action: {
                                    isLiked.toggle()
                                }, label: {
                                    Image(systemName: isLiked ? "heart.fill" : "heart")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 24)
                                        .tint(isLiked ? Color(.red) : Color(.black))
                                })
                                
                                Button(action: {
                                    openComments=true
                                }, label: {
                                    Image(systemName: "bubble")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 24)
                                })
                                
                            }.padding()
                                .background(.myGray)
                                .cornerRadius(10)
                        }
                    }
                    ZStack{
                        VStack{
                            Text(project.summary)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .padding(.top)
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(project.tags, id: \.self){ tag in
                                        Text(tag)
                                            .bold()
                                            .padding(10)
                                            .overlay{
                                                RoundedRectangle(cornerRadius: 25.0)
                                                    .tint(.black)
                                                    .opacity(0.3)
                                                    
                                            }
                                    }
                                }
                            }.padding()
                            
                            Text("[GitHub](https://www.google.com)")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .overlay{
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .tint(.black)
                                        .opacity(0.3)
                                        
                                }
                            
                            
                                .navigationTitle(project.name)
                            
                        }
                        .background(.myGray)
                        .padding()
                    }
                }
                
            }.sheet(isPresented: $openComments, content: {
                Text("comments")
            })
        }
    }
}
