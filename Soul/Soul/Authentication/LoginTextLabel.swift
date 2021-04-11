//
//  LoginTextLabel.swift
//  Soul
//
//  Created by Mark Rachapoom on 10/4/21.
//

import SwiftUI

struct LoginTextLabel: View {
    // MARK: - PROPERTIES
    
    let title: String
    let headline: String
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(self.title)
                .font(.system(size: 44, weight: .bold, design: .rounded))
            Text(self.headline)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
        }//: VSTACK
        .padding(.top, 40)
        .padding(.bottom, 20)
        .offset(x: -25)
    }
}

// MARK: - PREVIEW
struct LoginTextLabel_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextLabel(title: "Sign In", headline: "")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}


