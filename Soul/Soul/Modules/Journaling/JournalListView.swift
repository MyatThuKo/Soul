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
                .padding()
                .font(.system(size: 24, weight: .bold, design: .rounded))
        } else {
            journalList
        }
    }
    
    var journalList: some View {
        ScrollView {
            ForEach(viewModel.journals, id: \.self) { journals in
                showUserResultViewContent(journals)
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding(.all, 10)
            }
            .onDelete(perform: viewModel.deleteItem)
            .background(Color.background)
            .frame(maxWidth: .infinity)
        }        
    }
    
    func showUserResultViewContent(_ journal: Journal) -> AnyView {
        return AnyView(
            VStack {
                Button(action: {
                }) {
                    HStack {
                        VStack {
                            Text(journal.title)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(Color.black)
                                .padding(.horizontal, 30)
                            Text(journal.note)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(Color.black)
                                .padding(.horizontal, 30)
                        }
                        .padding(.vertical, 30)
                    }
                }
                .padding(5)
            }
            .frame(maxWidth: .infinity)
        )
    }
}

struct JournalListView_Previews: PreviewProvider {
    
    static var previews: some View {
        JournalListView(viewModel: JournalViewModel())
        JournalListView(viewModel: JournalViewModel())
            .preferredColorScheme(.dark)
    }
}
