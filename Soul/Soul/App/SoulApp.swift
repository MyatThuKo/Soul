//
//  SoulApp.swift
//  Soul
//
//  Created by Myat Thu Ko on 4/10/21.
//
import FirebaseCore
import SwiftUI

@main
struct SoulApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(APIServiceManager())
        }
    }
}
