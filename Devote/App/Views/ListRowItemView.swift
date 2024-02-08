//
//  ListRowItemView.swift
//  Devote
//
//  Created by Ivan Romero on 08/02/2024.
//

import SwiftUI

struct ListRowItemView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    // MARK: - FUNCTIONS
    
    
    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
            .font(.system(.title2, design: .rounded))
            .fontWeight(.heavy)
            .foregroundStyle(item.completion ? .pink : .primary)
            .padding(.vertical, 12)
            .animation(.default, value: item.completion)
        }
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange, perform: { _ in
            if self.viewContext.hasChanges {
                try? viewContext.save()
            }
        })
    }
}

//// MARK: - PREVIEW
//#Preview {
//    ListRowItemView()
//}
