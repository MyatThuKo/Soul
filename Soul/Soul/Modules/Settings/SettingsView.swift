//
//  SettingsView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var session: APIServiceManager
    var body: some View {
        NavigationView {
            VStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 0.0, y: 0.0)
                    .padding()
                
                GroupBox {
                    
                }
                
                Spacer()
            }//: VSTACK
            
            
            
//            List {
//                Label("Signout", systemImage: "power")
//                    .onTapGesture {
//                        session.logout()
//                    }
//            }
//            .listStyle(SidebarListStyle())
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
