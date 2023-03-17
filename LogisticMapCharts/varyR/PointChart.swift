//
//  PointChart.swift
//  LogisticMapCharts
//
//  Created by cbcmusic on 2023-03-11.
//

import SwiftUI
import Charts

struct PointChart: View {
    @ObservedObject var model = LogisticMapModel()
    var body: some View {
        Chart {
            ForEach(Array(model.xVals.enumerated()), id: \.element) { offset, element in
                PointMark(x: .value("step", Double(offset)),
                         y: .value("pop", element))
                .symbolSize(10)
            }
        }
        .chartYScale(domain: (0...1))
        .chartXScale(domain: 0...model.numSteps)
        .layoutPriority(2)
    }
}

struct PointChart_Previews: PreviewProvider {
    static var previews: some View {
        PointChart()
    }
}
