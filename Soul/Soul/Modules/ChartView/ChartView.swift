//
//  ChartView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    // MARK: - PREVIEW
    let tempData: [Double] = [1, 2, 3, 4, 2, 3, 10]
    let lineChartTitle: String = "Line Chart Title"
    let lineChartLegend: String = "Line Chart Legend"
    
    @EnvironmentObject var session: APIServiceManager
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // BACKGROUND
                Color.background.ignoresSafeArea(.all, edges: .all)
                
                // GREEN BOX
                VStack {
                    RoundedRectangle(cornerRadius: 47.0)
                        .foregroundColor(Color(#colorLiteral(red: 0.8691701293, green: 0.9764989018, blue: 0.9762008786, alpha: 1)))
                        .ignoresSafeArea(.all, edges: .top)
                        .frame(maxHeight: 370)
                        .offset(y: -50)
                    Spacer()
                }//: VSTACK
                
                VStack {
                    // GREETING MESSAGE
                    HStack {
                        Text("Hey, \(session.user?.userName ?? "Joe")")
                            .font(.system(size: 42, weight: .heavy, design: .rounded))
                            .foregroundColor(Color(#colorLiteral(red: 0.09700327367, green: 0.1035419181, blue: 0.09760505706, alpha: 1)))
                            .padding(.horizontal, 20)
                        Spacer()
                    }//: HSTACK
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.vertical)
                    
                    // GRAPHS
                    LineGraphView(data: tempData, title: lineChartTitle, legend: lineChartLegend)
                    
                    HStack {
                        Text("Placeholder")
                            .font(.system(size: 32, weight: .heavy, design: .rounded))
                            .padding(.horizontal, 20)
                        Spacer()
                    }//: HSTACK
                    .padding(.top, 40)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 20) {
                            ForEach(0..<5) { item in
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 240, height: 160, alignment: .center)
                                    .foregroundColor(.white)
                                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 10, x: 0.0, y: 0.0)
                                    .padding(.vertical, 20)
                            }
                        }
                    })
                    
                    Spacer()
                }//: VSTACK
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .leading)
                
            }//: ZSTACK
        }//: GEO READER
    }
}

// MARK: - PREVIEW
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
        ChartView()
            .preferredColorScheme(.dark)
    }
}
