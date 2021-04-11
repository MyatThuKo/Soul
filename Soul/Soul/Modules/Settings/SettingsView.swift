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
            List {
                Label("Signout", systemImage: "power")
                    .onTapGesture {
                        session.logout()
                    }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
