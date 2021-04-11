//
//  MoodViews.swift
//  Soul
//
//  Created by Myat Thu Ko on 4/10/21.
//

import SwiftUI

struct MoodViews: View {
    // MARK: - PROPERTIES
    @State private var mood = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    mood = "Excellent"
                }, label: {
                    Image("excellent")
                })
                Button(action: {
                    mood = "Happy"
                }, label: {
                    Image("happy")
                })
                Button(action: {
                    mood = "Good"
                }, label: {
                    Image("good")
                })
                Button(action: {
                    mood = "Sad"
                }, label: {
                    Image("sad")
                })
                Button(action: {
                    mood = "Awful"
                }, label: {
                    Image("awful")
                })
            } //: HStack
            
            Text(mood)
        }
    }
}

// MARK: - PREVIEW
struct MoodViews_Previews: PreviewProvider {
    static var previews: some View {
        MoodViews()
            .previewLayout(.sizeThatFits)
            .padding(.horizontal)
    }
}
