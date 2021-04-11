//
//  TextFieldView.swift
//  Soul
//
//  Created by Mark Rachapoom on 10/4/21.
//

import SwiftUI

struct TextFieldView: View {
    // MARK: - PROPERTIES
    
    @State var viewModel: AuthenticationViewModel

    var isRegisterView: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Group {
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(UITextAutocapitalizationType.none)
                    .disableAutocorrection(true)
                
                PasswordField(
                    "Password",
                    text: $viewModel.password
                )
                
                if isRegisterView {
                    PasswordField(
                        "Confirm Password",
                        text: $viewModel.confirmPassword
                    )
                    TextField("Username", text: $viewModel.userName)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            .font(.system(size: 19, weight: .bold, design: .rounded))
            .background(
                Color(UIColor.tertiarySystemFill)
                    .cornerRadius(13)
            )
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .font(.system(size: 14, weight: .light, design: .rounded))
                    .foregroundColor(.red)
                    .padding(.horizontal, 15)
            }
        }//: VSTACK
    }
}

// MARK: - PREVIEW
struct TextFieldView_Previews: PreviewProvider {
    
    @State var viewModel = AuthenticationViewModel()
    
    static var previews: some View {
        Group {
            TextFieldView(viewModel: AuthenticationViewModel(), isRegisterView: true)
            TextFieldView(viewModel: AuthenticationViewModel(), isRegisterView: false)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
