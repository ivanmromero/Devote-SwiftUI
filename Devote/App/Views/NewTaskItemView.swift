//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Ivan Romero on 07/02/2024.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State var task: String = ""
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    // MARK: - FUNCTIONS
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.id = UUID()
            newItem.completion = false
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            
            VStack {
                VStack(alignment: .center, spacing: 16) {
                    TextField("New task", text: $task)
                        .foregroundStyle(.pink)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .padding()
                        .background(
                            isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                        )
                        .clipShape(.rect(cornerRadius: 10))
                    
                    Button {
                        addItem()
                        task = ""
                        hideKeyboard()
                        isShowing = false
                        playSound(sound: "sound-ding", type: "mp3")
                        feedback.notificationOccurred(.success)
                    } label: {
                        Spacer()
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Spacer()
                    }
                    .disabled(isButtonDisabled)
                    .onTapGesture {
                        if isButtonDisabled {
                            playSound(sound: "sound-tap", type: "mp3")
                        }
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(isButtonDisabled ? .blue : .pink)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal)
                .padding(.vertical, 20)
                .background(
                    isDarkMode ? Color(UIColor.secondarySystemBackground) : .white
                )
                .clipShape(.rect(cornerRadius: 16))
                .shadow(color: .black.opacity(0.65), radius: 24)
                .frame(maxWidth: 640)
            }
            .padding()
        }
    }
}

// MARK: - PREVIEW
#Preview {
    NewTaskItemView(isShowing: .constant(true))
        .background (
            Color.gray.ignoresSafeArea(.all, edges: .all)
        )
}
