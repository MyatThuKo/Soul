//
//  DashboardView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI

struct DashboardView: View {
    // MARK: - PROPERTIES
    @State var selectedIndex = 0
    
    let tabBarImages = ["chart.bar.fill", "person.fill.questionmark", "gearshape"]
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                switch selectedIndex {
                case 0:
                    ChartView()
                case 1:
                    JournalingView()
                default:
                    SettingsView()
                }
                HStack {
                    ForEach(0..<3, id: \.self) { page in
                        
                        Spacer()
                        
                        Button (action: {
                            self.selectedIndex = page
                        }, label: {
                            Image(systemName: tabBarImages[page])
                                .font(.system(size: 25, weight: .semibold))
                                .foregroundColor(selectedIndex == page ? .primary : .secondary)
                        })//: BUTTON
                        
                        Spacer()
                        
                    }//: LOOP
                }//: HSTACK TAB
                .padding(.top, 20)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.menuBar.ignoresSafeArea(.all, edges: .bottom))
            }//: VSTACK
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }//: GEOMETRY
        .padding(.vertical)
        .ignoresSafeArea(.all, edges: .vertical)
    }


}

// MARK: - PREVIEW
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
            DashboardView()
                .preferredColorScheme(.dark)
        }
    }
}

