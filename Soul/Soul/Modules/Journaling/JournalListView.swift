//
//  JournalListView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI

struct JournalListView: View {
    @ObservedObject var viewModel: JournalViewModel
    @ViewBuilder
    var body: some View {
        if viewModel.journals.isEmpty {
            Text("No Journals available")
        } else {
            
        }
    }
    
    var journalList: some View {
        List(viewModel.journals, id: \.self) { journal in
            Text("\(journal.note)")
        }
    }
}

struct JournalListView_Previews: PreviewProvider {
    static var previews: some View {
        JournalListView(viewModel: JournalViewModel())
    }
}
