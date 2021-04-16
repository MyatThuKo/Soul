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
    // MARK: - PROPERTIES
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    init() {
        FirebaseApp.configure()
    }
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(APIServiceManager())
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
