//
//  ProjectCard.swift
//  MCFinal
//
//  Created by Marzia Pirozzi on 18/05/24.
//

import Foundation
import SwiftUI

struct ProjectCard: View {
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            //            if let firstPhotoData = project.photos.first, let uiImage = UIImage(data: firstPhotoData) {
            //                Image(uiImage: uiImage)
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(minWidth: 0, maxWidth: .infinity)
            //
            //            }
            
            Image("pfp")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
                .clipShape(
                    CustomRectangle(topLeftRadius: 45, topRightRadius: 5, bottomLeftRadius: 5, bottomRightRadius: 45)
                )
            
        }
        
    }
}
