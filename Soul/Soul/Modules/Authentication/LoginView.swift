//
//  LoginView.swift
//  Soul
//
//  Created by Mark Rachapoom on 10/4/21.
//

import SwiftUI

struct LoginView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var session: APIServiceManager
    @ObservedObject var viewModel = AuthenticationViewModel()
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.background
                    .ignoresSafeArea(.all)
                VStack {
                    // MARK: - HEAD
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Sign In")
                            .font(.system(size: 44, weight: .bold, design: .rounded))
                        Text("Welcome back.\nYou've been missed!")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                    }//: VSTACK
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                    .offset(x: -25)
                    
                    Spacer()
                    
                    // MARK: - TEXT FIELD
                    TextFieldView(
                        viewModel: viewModel,
                        isRegisterView: false
                    )
                    .padding()
                    
                    Spacer()
                    
                    // MARK: - SIGNING AND REGISTER
                    VStack(spacing: 0) {
                        
                        HStack {
                            Text("Don't have an account?")
                                .foregroundColor(Color(.systemGray2))
                                .font(.system(size: 17,weight: .bold, design: .rounded))
                            NavigationLink(destination: RegisterView()) {
                                Text("Register")
                                    .foregroundColor(Color(.systemGray))
                                    .font(.system(size: 17,weight: .bold, design: .rounded))
                            }//: NAV LINK
                        }//: HSTACK
                        
                        Button(action: {
                            viewModel.buttonAction(session: session, isRegisterView: false)
                        }, label: {
                            Text("Sign In")
                                .font(.system(size: 19, weight: .bold, design: .rounded))
                        })//: BUTTON
                        .padding(.vertical, 40)
                        .background(
                            Color.primary
                                .frame(width: 345, height: 64, alignment: .center)
                                .cornerRadius(17)
                        )
                        .foregroundColor(Color.background)
                    }//: VSTACK
                }//: VSTACK
            }//: ZSTACK
            .navigationBarHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
        }//: NAVIGATION
    }
}

// MARK: - PREVIEW
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
        LoginView()
            .preferredColorScheme(.dark)
    }
}
