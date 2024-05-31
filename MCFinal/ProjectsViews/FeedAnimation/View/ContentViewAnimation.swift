//
//  ContentViewAnimation.swift
//  MCFinal
//
//  Created by Claudio Borrelli on 31/05/24.
//

import SwiftUI

struct ContentViewAnimation: View {
    var body: some View {
        NavigationStack {
            Home()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentViewAnimation()
}
