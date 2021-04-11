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
            ForEach(viewModel.journals.indices, id: \.self) { i in
                showUserResultViewContent(i)
                    .background(Color.white)
                    .cornerRadius(15)
                    .padding(.all, 10)
            }
            .background(Color.background)
            .frame(maxWidth: .infinity)
        }
        .background(Color.background)
        .frame(maxWidth: .infinity)
    }
    
    func showUserResultViewContent(_ index: Int) -> AnyView {
        return AnyView(
            VStack {
                    Button(action: {
                    }) {
                        HStack {
                            VStack {
                                Text(viewModel.journals[index].title)
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal, 30)
                                Text(viewModel.journals[index].note)
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal, 30)
                                    .padding(.bottom, 5)
                                Text(viewModel.journals[index].mood)
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal, 30)
                                Text(viewModel.journals[index].date)
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal, 30)
                            }
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            Button(action: { viewModel.delete(index: index) }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .padding()
                        }
                    }
                   
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
