//
//  RegisterView.swift
//  Soul
//
//  Created by Mark Rachapoom on 10/4/21.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var session: APIServiceManager
    @ObservedObject var viewModel = AuthenticationViewModel()
    // MARK: - BODY
    var body: some View {
            ZStack(alignment: .leading) {
                Color.background
                    .ignoresSafeArea(.all)
                VStack {
                    // MARK: - HEAD
                    HStack {
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(Color("foreground-color"))
                        })
                        Spacer()
                    }//: HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Register")
                            .font(.system(size: 44, weight: .bold, design: .rounded))
                        Text("Sign up to get started")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                    }//: VSTACK
                    .padding(.vertical, 20)
                    .padding(.horizontal, 45)
                    .offset(x: -25)
                    
                    Spacer()
                    
                    // MARK: - TEXT FIELD
                    TextFieldView(
                        email: $viewModel.email,
                        password: $viewModel.password
                    )
                    .padding()
                    
                    Spacer()
                    
                    // MARK: - SIGNIN AND REGISTER
                    VStack(spacing: 0) {
                        
                        HStack {
                            Text("hidden text")
                                .font(.system(size: 17,weight: .bold, design: .rounded))
                        }//: HSTACK
                        .foregroundColor(Color("background-color"))
                        
                        Button(action: {
                            viewModel.buttonAction(session: session, register: true)
                        }, label: {
                            Text("Create Account")
                                .font(.system(size: 19, weight: .bold, design: .rounded))
                        })//: BUTTON
                        .padding(.vertical, 40)
                        .background(
                            Color.primary
                                .frame(width: 345, height: 64, alignment: .center)
                                .cornerRadius(17)
                        )
                        .foregroundColor(Color("background-color"))
                        .navigationBarHidden(true)
                    }//: VSTACK
                }//: VSTACK
            }//: ZSTACK
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
