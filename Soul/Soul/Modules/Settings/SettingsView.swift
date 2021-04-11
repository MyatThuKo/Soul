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
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 0.0, y: 0.0)
                    .padding()
                
                Text(session.user?.userName ?? "Joe")
                    .font(.system(size: 44, weight: .heavy, design: .rounded))
                
                VStack(spacing: 7) {
                    // DARK MODE
                    Group {
                        GroupBox {
                            HStack {
                                Image(systemName: isDarkMode ? "moon.fill" : "moon")
                                    .font(.system(size: 21, weight: .bold, design: .rounded))
                                Spacer()
                                Toggle(isOn: $isDarkMode, label: {
                                    Text("Dark Mode")
                                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                                })
                            }//: HSTACK
                        }//: GROUPBOX
                        
                        GroupBox {
                            HStack {
                                Image(systemName: "power")
                                    .font(.system(size: 21, weight: .bold, design: .rounded))
                                Text("Log out")
                                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                                    .onTapGesture { 
                                       session.logout()
                                    }
                                Spacer()
                            }//: HSTACK
                        }
                    }//: GROUP
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                }
                
                Spacer()
            }//: VSTACK
            .navigationTitle("Settings")
        }
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
