//
//  BlankView.swift
//  Devote
//
//  Created by Ivan Romero on 07/02/2024.
//

import SwiftUI

struct BlankView: View {
    // MARK: - PROPERTIES
    // MARK: - FUNCTIONS
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(.black)
        .opacity(0.5)
        .ignoresSafeArea(.all)
    }
}

// MARK: - PREVIEW
#Preview {
    BlankView()
}
