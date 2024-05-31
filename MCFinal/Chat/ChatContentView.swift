//
//  ChatContentView.swift
//  MCFinal
//
//  Created by Claudio Borrelli on 31/05/24.
//

import SwiftUI

struct ChatContentView: View {
    @State private var query = ""
    @StateObject var viewModel = ChatsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach((viewModel.getSortedFilteredChats(query: query))) { chat in
                    ZStack{
                        ChatRowView(chat: chat)
                            
                        NavigationLink(destination: {
                            ChatView(chat: chat)
                                .environmentObject (viewModel)
                        }) {
                            EmptyView()
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: 0)
                        .opacity (0)
                    }
                    .swipeActions (edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                        })
                        {
                            if chat.hasUnreadMessage {
                                Label ("Read", systemImage: "text.bubble")
                            }
                            else {
                                Label ("Unread", systemImage: "circle.fill")
                            }
                        }
                        .tint(.blue)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle ("Chats")
            .navigationBarItems(trailing: Button(action: {}) {
                Image (systemName: "square, and pencil")
            })
        }
    }
}

#Preview {
    ChatContentView()
}
