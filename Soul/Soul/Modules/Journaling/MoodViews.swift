//
//  MoodViews.swift
//  Soul
//
//  Created by Myat Thu Ko on 4/10/21.
//

import SwiftUI

struct MoodViews: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel: JournalViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                ForEach(viewModel.moodArray, id: \.self) { item in
                    Button(action: {
                            viewModel.mood = item
                        }, label: {
                            Image(item)
                        }
                    )
                }
            } //: HStack
            Text(viewModel.mood)
        }
    }
}

// MARK: - PREVIEW
struct MoodViews_Previews: PreviewProvider {
    static var previews: some View {
        MoodViews(viewModel: JournalViewModel())
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
    }
}
