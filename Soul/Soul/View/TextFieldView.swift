//
//  TextFieldView.swift
//  Soul
//
//  Created by Mark Rachapoom on 10/4/21.
//

import SwiftUI

struct TextFieldView: View {
    // MARK: - PROPERTIES
    
    @Binding var email: String
    @Binding var password: String
    
    @State private var isShowingPassword: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Group {
                TextField("Username, email", text: $email)
                HStack {
                    if isShowingPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                    Spacer()
                    Button(action: {
                        self.isShowingPassword.toggle()
                    }, label: {
                        Image(systemName: isShowingPassword ? "eye" : "eye.fill")
                            .foregroundColor(.primary)
                            .opacity(0.75)
                    })
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            .font(.system(size: 19, weight: .bold, design: .rounded))
            .background(
                Color(UIColor.tertiarySystemFill)
                    .cornerRadius(13)
            )
        }//: VSTACK
    }
}

// MARK: - PREVIEW
struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextFieldView(email: .constant("email"), password: .constant("password"))
            TextFieldView(email: .constant("email"), password: .constant("password"))
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
