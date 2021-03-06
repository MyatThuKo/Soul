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
    
    @State private var showCalendar = false
    
    init(_ viewModel: JournalViewModel) {
        UITextView.appearance().backgroundColor = .clear
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Add Title...", text: $viewModel.titleText)
                    .font(.system(size: 26, weight: .heavy, design: .rounded))
                    .padding()
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color(UIColor.secondarySystemBackground))
                    
                    if viewModel.noteText.isEmpty {
                        Text("Add notes...")
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(.horizontal)
                            .padding(.vertical)
                    }
                    
                    TextEditor(text: $viewModel.noteText)
                        .padding(.horizontal)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                    
                } //: ZStack
                .frame(height: 300)
                .font(.body)
                .padding(.horizontal, 22)
                .padding(.vertical, 14)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .font(.system(size: 14, weight: .light, design: .rounded))
                        .foregroundColor(.red)
                        .padding([.horizontal, .vertical], 15)
                }
                
                VStack {
                    Text("How are you today?")
                    MoodViews(viewModel: viewModel)
                }
                
                VStack {
                    Button("For Date \(viewModel.dateText)", action: {
                        self.showCalendar.toggle()
                    })
                    .sheet(isPresented: $showCalendar) {
                        CalendarView(viewModel: viewModel)
                            .padding(20)
//                            .accentColor(.orange)
                    }
                }
                
                Spacer()
            } //: VStack
            .navigationBarTitle("Add New Notes", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        viewModel.addNewJournal(session)
                                        if viewModel.errorMessage.isEmpty {
                                            presentationMode.wrappedValue.dismiss()
                                        }
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
            .preferredColorScheme(.dark)
    }
}
