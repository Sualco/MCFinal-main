import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatsViewModel
    let chat: Chat
    
    @State private var text = ""
    @FocusState private var isFocused
    @State private var textViewHeight: CGFloat = 20
    @State private var messageIDToScroll: UUID?
    
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { reader in
                ScrollView {
                    ScrollViewReader { scrollReader in
                        getMessagesView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange (of: messageIDToScroll) { _ in
                                if let messageID = messageIDToScroll {
                                    scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                }
                            }
                            .onAppear {
                                if let messageID = chat.messages.last?.id {
                                    scrollTo(messageID: messageID, anchor: .bottom,
                                             shouldAnimate: false, scrollReader: scrollReader)
                                }
                            }
                    }
                }
            }
            .padding (.bottom, 5)
            
            toolbarView()
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navBarLeadingBtn,trailing: navBarTrailingBtn)
        .onAppear {
            viewModel.markAsUnread (false, chat: chat)
        }
    }
    
    var navBarLeadingBtn: some View {
        Button (action: {}) {
            HStack {
                Image (chat.person.imgString)
                
                    .resizable ()
                    .frame (width: 40, height: 40)
                    .clipShape(Circle())
                Text (chat.person.name).bold()
            }
            .foregroundColor(.black)
        }
    }
    
    var navBarTrailingBtn: some View {
        HStack {
            Button (action: {}) {
                Image (systemName: "video")
            }
            Button (action: {}) {
                Image (systemName: "phone" )
            }
        }
    }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool,
                  scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
    
    
    func toolbarView() -> some View {
        VStack {
            let height: CGFloat = 37
            
            HStack {
                ZStack(alignment: .topLeading) {
                    if text.isEmpty {
                        Text("Enter your message...")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                    }
                    TextEditor(text: $text)
                        .padding(.horizontal, 10)
                        .frame(minHeight: 10,maxHeight: textViewHeight)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 13))
                        .focused($isFocused)
                        .opacity(text.isEmpty ? 0.25 : 1)  // Adjusting opacity to help with the placeholder
                        .onChange(of: text) { _ in
                            calculateHeight()
                        }
                }

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                            Circle()
                                .foregroundColor(text.isEmpty ? .gray : .blue)
                        )
                }
                .disabled(text.isEmpty)
            }
            
        }
        .padding(.vertical)
        .padding (.horizontal)
        .background(.thickMaterial)
    }
    
    func sendMessage() {
        
        if let message = viewModel.sendMessage(text, in: chat) {
            text = ""
            messageIDToScroll = message.id
        }
    }
    
    func calculateHeight() {
        let lineHeight: CGFloat = UIFont.systemFont(ofSize: 17).lineHeight
        let maxHeight = lineHeight * 5 // 5 lines
        
        let size = CGSize(width: UIScreen.main.bounds.width - 90, height: .infinity)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        let boundingRect = attributedText.boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil)
        
        textViewHeight = min(maxHeight, boundingRect.height + 20)
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid (columns: columns, spacing: 0, pinnedViews: [.sectionHeaders]) {
            let sectionMessages = viewModel.getSectionMessages(for: chat)
            ForEach(sectionMessages.indices, id: \.self) { sectionIndex in
                let messages = sectionMessages[sectionIndex]
                Section (header: sectionHeader(firstMessage: messages.first!)) {
                    ForEach(messages) { message in
                        let isReceived = message.type == .Received
                        
                        HStack {
                            Text(message.text)
                                .padding(.horizontal,20)
                                .padding(.vertical, 12)
                                .background(
                                    CustomRectangle(
                                        topLeftRadius: isReceived ? 45 : 5,
                                        topRightRadius: isReceived ? 5 : 45,
                                        bottomLeftRadius: isReceived ? 5 : 45,
                                        bottomRightRadius: isReceived ? 45 : 5
                                    )
                                    .fill(isReceived ? Color.black.opacity(0.2) : Color.green.opacity(0.9))
                                )
                                .frame(width: viewWidth * 0.7, alignment: isReceived ? .leading : .trailing)
                                .padding(.vertical)
                        }
                        .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
                        .id(message.id)


                        
                    }
                }
                
                
            }
            
        }
    }
    
    func sectionHeader (firstMessage message: Message) -> some View {
        ZStack {
            Text (message.date.descriptiveString (dateStyle: .medium))
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .regular))
                .frame (width: 120)
                .padding(.vertical, 5)
                .background (Capsule().foregroundColor(.blue))
        }
        .padding(.vertical, 5)
        .frame (maxWidth: .infinity)
    }
}

#Preview {
    NavigationView {
        ChatView(chat: Chat.sampleChat[0])
            .environmentObject (ChatsViewModel())
    }
}
