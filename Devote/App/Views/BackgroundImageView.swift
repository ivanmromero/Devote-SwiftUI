//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Ivan Romero on 07/02/2024.
//

import SwiftUI

struct BackgroundImageView: View {
    // MARK: - PROPERTIES
    // MARK: - FUNCTIONS
    // MARK: - BODY
    var body: some View {
        Image("rocket")
            .resizable()
            .antialiased(true)
            .scaledToFill()
            .ignoresSafeArea()
    }
}

// MARK: - PREVIEW
#Preview {
    BackgroundImageView()
}
