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
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Text("Journaling view")
                .navigationBarItems(trailing: Button(action: {
                    addJournal.toggle()
                }, label: {
                    Text("Add")
                })
                .sheet(isPresented: $addJournal) {
                    JournalNotesView()
                }
                )
        }
    }
}

// MARK: - PREVIEW
struct JournelingView_Previews: PreviewProvider {
    static var previews: some View {
        JournalingView()
    }
}
