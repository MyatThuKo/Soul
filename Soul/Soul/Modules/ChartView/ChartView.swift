//
//  ChartView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI

struct ChartView: View {
    var body: some View {
        VStack {
            HStack {
                
                // HAMBURGER
                Button(action: {
                }, label: {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(Color.foreground)
                })
                
                Spacer()
                
                // MIDDLE
                Text("Soul")
                    .font(.system(size: 35, weight: .heavy, design: .rounded))
                    .foregroundColor(Color.foreground)
                
                Spacer()
                
                // PROFILE PICTURE
                Button(action: {
                    // Action when profile image has been pressed
                }, label: {
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45, alignment: .center)
                        .cornerRadius(15)
                })
            }
            .padding(.horizontal, 15)
            .padding(.bottom)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.menuBar)
            Spacer()
        }//: VSTACK
        .background(
            Color.background
                .ignoresSafeArea(.all, edges: .all)
        )
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChartView()
            ChartView()
                .preferredColorScheme(.dark)
        }
    }
}
