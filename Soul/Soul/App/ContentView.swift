//
//  ContentView.swift
//  Soul
//
//  Created by Myat Thu Ko on 4/10/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: APIServiceManager
    var body: some View {
        VStack {
            if session.isLoggedIn {
                DashboardView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            session.getUser()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(APIServiceManager())
    }
}
