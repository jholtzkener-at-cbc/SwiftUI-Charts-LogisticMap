@_private(sourceFile: "ComprehensiveView.swift") import LogisticMapCharts_Combine
import SwiftUI
import SwiftUI
import Charts

extension ComprehensiveView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/ComprehensiveView.swift", line: 29)
        ComprehensiveView()
    
#sourceLocation()
    }
}

extension ComprehensiveView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/ComprehensiveView.swift", line: 14)
        VStack {
            Chart {
                ForEach(model.slices) { slice in
                    ForEach(slice.buckets) { bucket in
                        PointMark(x: .value(__designTimeString("#21059.[2].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "r-value"), slice.rVal),
                                  y: .value(__designTimeString("#21059.[2].[1].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[1].value.arg[0].value", fallback: "x-value"), bucket.value))
                    }
                }
            }
        }
    
#sourceLocation()
    }
}

import struct LogisticMapCharts_Combine.ComprehensiveView
import struct LogisticMapCharts_Combine.ComprehensiveView_Previews
