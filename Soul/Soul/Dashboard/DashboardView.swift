//
//  DashboardView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            NavigationView {
                ChartView()
            }
            .tabItem {
                Image(systemName: "chart.bar.fill")
                Text("Quiz")
                    .font(.system(size: 12, weight: .light, design: .rounded))
            }
            NavigationView {
                JournalingView()
            }
            .tabItem {
                Image(systemName: "person.fill.questionmark")
                Text("Quiz")
                    .font(.system(size: 12, weight: .light, design: .rounded))
            }
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Image(systemName: "gearshape")
                Text("Settings")
                    .font(.system(size: 12, weight: .light, design: .rounded))
            }

        }
    
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

