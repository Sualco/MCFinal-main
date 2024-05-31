//
//  ImageView.swift
//  MCFinal
//
//  Created by Claudio Borrelli on 31/05/24.
//

import SwiftUI

struct ImageView: View {
    var post: Item
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            if let image = post.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipped()
            }
            
        }
    }
}
