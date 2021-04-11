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
            ChartView(data: [2, 21, 10, 15, 7])
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Chart")
                        .font(.system(size: 12, weight: .light, design: .rounded))
                }
            JournalingView()
                .tabItem {
                    Image(systemName: "person.fill.questionmark")
                    Text("Journal")
                        .font(.system(size: 12, weight: .light, design: .rounded))
                }
            SettingsView()
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

