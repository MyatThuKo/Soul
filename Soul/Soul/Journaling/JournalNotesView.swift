//
//  JournalNotesView.swift
//  Soul
//
//  Created by Myat Thu Ko on 4/10/21.
//

import SwiftUI

struct JournalNotesView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    @State private var titleText = ""
    @State private var noteText = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Add Title...", text: $titleText)
                    .padding(.horizontal)
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color(UIColor.secondarySystemBackground))
                    
                    if noteText.isEmpty {
                        Text("Add notes...")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(.horizontal)
                            .padding(.vertical)
                    }
                    
                    TextEditor(text: $noteText)
                        .padding(4)
                    
                } //: ZStack
                .frame(height: 300)
                .font(.body)
                
                Spacer()
            } //: VStack
            .navigationBarItems(trailing:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                    })
                                    .foregroundColor(.blue)
                                    .opacity(0.8)
            )
        } //: NavigationView
    }
}

// MARK: - PREVIEW
struct JournalNotesView_Previews: PreviewProvider {
    static var previews: some View {
        JournalNotesView()
    }
}
