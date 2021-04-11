//
//  SettingsView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var session: APIServiceManager
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            
            VStack(spacing: 10) {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.55), radius: 8, x: 0.0, y: 0.0)
                    .padding()
                VStack(spacing: 0) {
                    Text(session.user?.userName ?? "Joe")
                        .font(.system(size: 44, weight: .heavy, design: .rounded))
                    Text("@rabbitJoJo")
                        .font(.system(size: 22, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(.systemGray2))
                }.padding(.bottom, 10)
                
                VStack(spacing: 15) {
                    // DARK MODE
                    Group {
                        HStack {
                            Image(systemName: isDarkMode ? "moon.fill" : "moon")
                                .font(.system(size: 21, weight: .bold, design: .rounded))
                            Spacer()
                            Toggle(isOn: $isDarkMode, label: {
                                Text("Dark Mode")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                            })
                        }//: HSTACK
                        
                        HStack {
                            Image(systemName: "arrow.right.square")
                                .font(.system(size: 21, weight: .bold, design: .rounded))
                            Text("Log out")
                                .font(.system(size: 18, weight: .semibold, design: .rounded))
                            Spacer()
                        }//: HSTACK
                        .foregroundColor(.pink)
                        .onTapGesture {
                            session.logout()
                        }
                        
                    }
                    .padding()
                    .background(
                        Color(UIColor.tertiarySystemFill)
                    )
                    .cornerRadius(15)
                }
                .padding()
                
                Spacer()
            }//: VSTACK
            .background(Color.background.ignoresSafeArea(.all))
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

/*
 Group {
     TextField("Username, email", text: $viewModel.email)
     
     PasswordField(
         "Password",
         text: $viewModel.password
     )
     
     if isRegisterView {
         PasswordField(
             "Confirm Password",
             text: $viewModel.confirmPassword
         )
     }
 }
 .padding(.vertical, 20)
 .padding(.horizontal, 15)
 .font(.system(size: 19, weight: .bold, design: .rounded))
 .background(
     Color(UIColor.tertiarySystemFill)
         .cornerRadius(13)
 )
 */

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
