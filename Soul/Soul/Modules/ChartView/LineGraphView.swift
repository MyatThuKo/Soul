//
//  LineGraphView.swift
//  Soul
//
//  Created by Myat Thu Ko on 4/11/21.
//

import SwiftUI
import SwiftUICharts

struct LineGraphView: View {
    // MARK: - PROPERTIES
    let data: [Double]
    let title: String
    let legend: String
    
    let chartStyle = ChartStyle(backgroundColor: Color.white, accentColor: Color.black, gradientColor: GradientColors.prplNeon, textColor: Color.black, legendTextColor: Color.black, dropShadowColor: Color.black)
    
    // MARK: - BODY
    var body: some View {
        LineChartView(data: data, title: title, legend: legend, style: chartStyle, form: ChartForm.extraLarge)
            .padding(.horizontal)
    }
}

// MARK: - PREVIEW
struct LineGraphView_Previews: PreviewProvider {
    static var previews: some View {
        LineGraphView(data: [1, 2, 3, 4, 5, 4, 6, 10], title: "Line Chart View", legend: "Past 10 days")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
