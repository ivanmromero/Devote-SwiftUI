//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Ivan Romero on 08/02/2024.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    feedback.notificationOccurred(.success)
                    
                    switch configuration.isOn {
                    case true:
                        playSound(sound: "sound-rise", type: "mp3")
                    case false:
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
            
            configuration.label
        }
    }
}

// MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    Toggle("Placeholder label", isOn: .constant(false))
        .padding()
        .toggleStyle(CheckboxStyle())
}
