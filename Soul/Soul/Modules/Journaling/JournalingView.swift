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
    
    @State private var addJournal = false
    @EnvironmentObject var session: APIServiceManager
    @ObservedObject var viewModel = JournalViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            JournalListView(viewModel: viewModel)
                .navigationBarItems(trailing: Button(action: {
                        addJournal.toggle()
                    }, label: {
                        Image(systemName: "note.text.badge.plus")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                            .foregroundColor(.green)
                            .opacity(0.7)
                    }
                )
                .sheet(isPresented: $addJournal) {
                    JournalNotesView(viewModel)
                    }
                )
                .onAppear {
                    viewModel.fetchJournals(session)
                }
                .navigationBarTitle(Text("Journals"), displayMode: .inline)
        }
    }
}

// MARK: - PREVIEW
struct JournelingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            JournalingView()
                .environmentObject(APIServiceManager())
            JournalingView()
                .preferredColorScheme(.dark)
                .environmentObject(APIServiceManager())
        }
    }
}
