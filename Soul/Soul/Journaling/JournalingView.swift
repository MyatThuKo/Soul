//
//  JournelingView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI

struct JournalingView: View {
    // MARK: - PROPERTIES
    @State private var journalNotes = ""
    @State private var showFullTextField = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "note.text")
                Text("Notes")
                Spacer()
                Button(action: {
                    self.showFullTextField.toggle()
                }, label: {
                    Image(systemName: "arrow.up.forward")
                })
                .sheet(isPresented: $showFullTextField) {
                    JournalNotesView()
                }
            }
            
            TextField("Add notes...", text: $journalNotes)
                .padding(.horizontal)
                .frame(height: 50)
                .background(
                    Color.blue
                        .opacity(0.5)
                )
                .clipShape(Capsule())
        }
    }
}

// MARK: - PREVIEW
struct JournelingView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
