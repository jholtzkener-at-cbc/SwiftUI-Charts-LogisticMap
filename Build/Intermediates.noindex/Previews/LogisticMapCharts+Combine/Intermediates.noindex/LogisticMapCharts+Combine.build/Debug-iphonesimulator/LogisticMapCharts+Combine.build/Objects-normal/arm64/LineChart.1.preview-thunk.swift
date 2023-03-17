@_private(sourceFile: "LineChart.swift") import LogisticMapCharts_Combine
import SwiftUI
import SwiftUI
import Charts

extension LineChart_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/r-value charts/LineChart.swift", line: 29)
        LineChart()
    
#sourceLocation()
    }
}

extension LineChart {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/r-value charts/LineChart.swift", line: 15)
        Chart {
            ForEach(Array(model.xVals.enumerated()), id: \.element) { offset, element in
                LineMark(x: .value(__designTimeString("#20112.[2].[1].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[0].value.arg[0].value", fallback: "step"), Double(offset)),
                         y: .value(__designTimeString("#20112.[2].[1].property.[0].[0].arg[0].value.[0].arg[2].value.[0].arg[1].value.arg[0].value", fallback: "pop"), element))
            }
        }
        .chartYScale(domain: (__designTimeInteger("#20112.[2].[1].property.[0].[0].modifier[0].arg[0].value.[0].[0]", fallback: 0)...__designTimeInteger("#20112.[2].[1].property.[0].[0].modifier[0].arg[0].value.[0].[1]", fallback: 1)))
        .chartXScale(domain: __designTimeInteger("#20112.[2].[1].property.[0].[0].modifier[1].arg[0].value.[0]", fallback: 0)...model.numSteps)
        .layoutPriority(__designTimeInteger("#20112.[2].[1].property.[0].[0].modifier[2].arg[0].value", fallback: 2))
    
#sourceLocation()
    }
}

import struct LogisticMapCharts_Combine.LineChart
import struct LogisticMapCharts_Combine.LineChart_Previews
