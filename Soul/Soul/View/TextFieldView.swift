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
    
    @State var isShowingFirstPassword = false
    @State var isShowingConfirmPassword = false

    var isRegistering: Bool
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            Group {
                TextField("Username, email", text: $viewModel.email)
                
                showPasswordTextFields(hintText: "Password", textValue: $viewModel.password, isShowingPassword: &isShowingFirstPassword)
                
                if isRegistering {
                    showPasswordTextFields(hintText: "Confirm Password",
                                           textValue: $viewModel.confirmPassword, isShowingPassword: &isShowingConfirmPassword)
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
    
    func showPasswordTextFields(hintText: String, textValue: Binding<String>, isShowingPassword: inout Bool) -> AnyView {
           return AnyView(
                HStack {
                    if isShowingPassword {
                        TextField(hintText, text: textValue)
                    } else {
                       SecureField(hintText, text: textValue)
                    }
                    Button(action: {
                        isShowingPassword.toggle()
                    }) {
                        if isShowingPassword {
                            Image(systemName: "eye")
                                .foregroundColor(Color.foreground)
                        } else {
                            Image(systemName: "eye.slash")
                                .foregroundColor(Color.foreground)
                        }
                    }
                }
                .padding(.all, 10)
//                .background(Color.background)
                .cornerRadius(13)
//                .shadow(radius: 5.0, x: 5, y: 5)
           )
        }
}

// MARK: - PREVIEW
struct TextFieldView_Previews: PreviewProvider {
    
    @State var viewModel = AuthenticationViewModel()
    
    static var previews: some View {
        Group {
            TextFieldView(viewModel: AuthenticationViewModel(), isRegistering: true)
            TextFieldView(viewModel: AuthenticationViewModel(), isRegistering: false)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
