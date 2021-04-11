//
//  JournalNotesView.swift
//  Soul
//
//  Created by Myat Thu Ko on 4/10/21.
//

import SwiftUI

struct JournalNotesView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: JournalViewModel
    @EnvironmentObject var session: APIServiceManager
    @State private var titleText = ""
    @State private var noteText = ""
    
    init(_ viewModel: JournalViewModel) {
        UITextView.appearance().backgroundColor = .clear
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Add Title...", text: $viewModel.titleText)
                    .padding()
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color(UIColor.secondarySystemBackground))
                    
                    if viewModel.noteText.isEmpty {
                        Text("Add notes...")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(.horizontal)
                            .padding(.vertical)
                    }
                    
                    TextEditor(text: $viewModel.noteText)
                        .padding(.horizontal)
                    
                } //: ZStack
                .frame(height: 300)
                .font(.body)
                .padding()
                
                VStack {
                    Text("How are you today?")
                    MoodViews(viewModel: viewModel)
                }
                
                Spacer()
            } //: VStack
            .navigationBarTitle("Add New Notes", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        viewModel.addNewJournal(session)
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
        JournalNotesView(JournalViewModel())
    }
}
