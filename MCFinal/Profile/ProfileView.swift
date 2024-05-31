//
//  ProfileView.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//
import SwiftUI


struct ProfileView: View {
    @State var selectedTab: String = "lightbulb"
    @Namespace var animation
    @State private var rectangleColor: Color = .cyan
    @State var isFollowed: Bool = false
    @Environment(\.colorScheme) var scheme
    @GestureState private var dragOffset = CGSize.zero
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical,showsIndicators: false){
                ZStack{
                    CustomRectangle(topLeftRadius: 25, topRightRadius: 5, bottomLeftRadius: 5, bottomRightRadius: 25)
                        .foregroundStyle(rectangleColor)
                        .opacity(0.4)
                        .aspectRatio(1.8, contentMode: .fit)
                        .padding()
                        .frame(height: 230)
                    
                    
                    
                    HStack(alignment:.top,spacing: -15){
                        Spacer()
//                        NavigationLink(destination: EmptyView()){
//                            Image(systemName: "bell.fill")
//                            .foregroundStyle(Color.black)}
                       
                        NavigationLink(destination: OptionsMenuView()){
                                                    Image(systemName: "gearshape.fill")
                                                      .foregroundStyle(.black)}
                        .padding(.horizontal,30)
                    }.padding(.bottom,165)
                        
                    
                    VStack(spacing: 40){
                        
                        HStack(){
                            
                            Image("pfp")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            //.position(CGPoint(x: 70, y: 105))
                            
                            
                            
                            VStack(alignment: .leading, spacing: 10){
                                Text("@forzanapolisempre")
                                    .font(.headline)
                                    //.foregroundStyle(Color("BW"))
                                    .fontWeight(.bold)
                                    
                                
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke()
                                    .frame(width: 80, height: 30)
                                    //.foregroundStyle(.black)
                                    .opacity(0.8)
                                    .overlay{
                                        
                                        Text("Coder")
                                            //.foregroundStyle(Color("BW"))
                                            .fontWeight(.bold)
                                    }
                                
                                
                            }
                            
                            
                            VStack{
                                Text("200")
                                    .font(.title2)
                                    .bold()
                                Text("Connections")
                            }
                        }
                        
                    }
                }
                
                
                
                Spacer(minLength: 20)
                
                
                
                
                HStack(spacing:0){
                    
                    TabBarButton(image: "lightbulb", isSystemImage: true, animation: animation , selectedTab: $selectedTab)
                    
                    TabBarButton(image: "bonjour", isSystemImage: true, animation: animation , selectedTab: $selectedTab)
                    
                    TabBarButton(image: "person.crop.circle", isSystemImage: true, animation: animation , selectedTab: $selectedTab)
                    
                }
                .frame(height: 50, alignment: .bottom)
                .background(scheme == .dark ? Color.black : Color.white)
                
                
                Group {
                    if selectedTab == "bonjour" {
                       EmptyView()
                    } else if selectedTab == "lightbulb" {
                        ProfileIdeasView()
                    } else if selectedTab == "person.crop.circle" {
                       PersonalCardEditView()
                            
                    }
                }
                .transition(.identity)
                .transaction { transaction in
                    transaction.animation = nil
                }
                
                
                
                
            }
            .simultaneousGesture(
                DragGesture(minimumDistance: 10, coordinateSpace: .local)
                    .updating($dragOffset) { value, state, transaction in
                        state = value.translation
                    }
                    .onEnded({ value in
                        
                        if value.translation.width < 0 {
                            switch selectedTab {
                            case "lightbulb" :
                                withAnimation{
                                    selectedTab = "bonjour"
                                }
                            case "bonjour":
                                withAnimation{
                                    selectedTab = "person.crop.circle"
                                }
                            default:
                                break
                            }
                        } else if value.translation.width > 0 {
                            switch selectedTab {
                            case "person.crop.circle":
                                withAnimation{
                                    selectedTab = "bonjour"
                                }
                            case "bonjour":
                                withAnimation{
                                    selectedTab = "lightbulb"
                                }
                            default:
                                break
                            }
                        }
                        
                    })
                
            )
            
            
            .refreshable {
                //data refresh
            }
//            .toolbar{
//
//                ToolbarItem(placement:.topBarTrailing) {
//                    HStack{
//                        NavigationLink(destination: RequestView()){
//                            Image(systemName: "bell.fill")
//                                .foregroundStyle(Color("BW"))
//
//                        }
//
//                        NavigationLink(destination: OptionsMenuView()){
//                            Image(systemName: "gearshape.fill")
//                                .foregroundStyle(.black)
//                        }
//
//
//
//                    }
//                }
//            }
        }
        
    }
}


#Preview {
    ProfileView()
}

struct TabBarButton: View {
    
    var image: String
    var isSystemImage: Bool
    var animation: Namespace.ID
    
    
    @Binding var selectedTab: String
    
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut){
                selectedTab = image
            }
        }, label: {
            VStack(spacing: 12) {
                (isSystemImage ? Image(systemName: image) : Image(image)
                ).renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 28)
                    .foregroundStyle(selectedTab == image ? .primary : Color(.gray))
                
                ZStack{
                    if selectedTab == image{
                        Rectangle()
                            .fill(Color.primary)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        Rectangle()
                            .fill(Color.clear)
                        
                    }
                    
                }
                .frame(width: 120,height: 1)
            }
        })
        
    }
}


