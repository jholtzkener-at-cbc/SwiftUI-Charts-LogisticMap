//
//  LineChart.swift
//  LogisticMapCharts+Combine
//
//  Created by cbcmusic on 2023-03-11.
//

import SwiftUI
import Charts

struct LineChart: View {
    @ObservedObject var model = LogisticMapModel()
    
    var body: some View {
        Chart {
            ForEach(Array(model.xVals.enumerated()), id: \.element) { offset, element in
                LineMark(x: .value("step", Double(offset)),
                         y: .value("population", element))
            }
        }
        .chartYScale(domain: (0...1))
        .chartXScale(domain: 0...model.numSteps)
        .layoutPriority(2)
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart()
    }
}
