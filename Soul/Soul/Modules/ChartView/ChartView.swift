//
//  ChartView.swift
//  Soul
//
//  Created by Aswani G on 4/10/21.
//

import SwiftUI
import SwiftUICharts

struct ChartView: View {
    // MARK: - PROPERTIES
    let data: [Double]
    
    // MARK: - BODY
    var body: some View {
        LineView(data: data, title: "LineView")
    }
}

// MARK: - PREVIEW
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(data: [23, 1, 2, 3, 43, 20])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
