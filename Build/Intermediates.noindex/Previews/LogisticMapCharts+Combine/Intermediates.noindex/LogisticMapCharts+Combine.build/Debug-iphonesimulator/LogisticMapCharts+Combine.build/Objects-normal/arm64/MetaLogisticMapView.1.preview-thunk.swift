@_private(sourceFile: "MetaLogisticMapView.swift") import LogisticMapCharts_Combine
import SwiftUI
import SwiftUI
import Charts

extension MetaLogisticMapView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/MetaLogisticMapView.swift", line: 42)
        MetaLogisticMapView()
    
#sourceLocation()
    }
}

extension MetaLogisticMapView {
    @_dynamicReplacement(for: setOpacity(val:)) private func __preview__setOpacity(val: Double) -> Double {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/MetaLogisticMapView.swift", line: 34)
        
        let newVal = (val + __designTimeFloat("#24586.[2].[2].[0].value.[0]", fallback: 0.08)) * __designTimeInteger("#24586.[2].[2].[0].value.[1]", fallback: 2)
        return min(__designTimeInteger("#24586.[2].[2].[1].arg[0].value", fallback: 1), newVal)
    
#sourceLocation()
    }
}

extension MetaLogisticMapView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/MetaLogisticMapView.swift", line: 14)
        VStack {
            Text(__designTimeString("#24586.[2].[1].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Logistic Map - Behaviour across r-values"))
            Chart {
                ForEach(model.slices) { slice in
                    ForEach(slice.buckets) { bucket in
                        PointMark(x: .value(__designTimeString("#24586.[2].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[0].value.arg[0].value", fallback: "r-value"), slice.rVal),
                                  y: .value(__designTimeString("#24586.[2].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].arg[1].value.arg[0].value", fallback: "x-value"), bucket.xVal))
                        .foregroundStyle(.opacity(setOpacity(val: bucket.value)))
                        .symbolSize(__designTimeInteger("#24586.[2].[1].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[1].value.[0].modifier[1].arg[0].value", fallback: 5))
                    }
                }
            }
            .padding()
            .chartXScale(domain: model.minR...model.maxR)
            .chartXAxisLabel(__designTimeString("#24586.[2].[1].property.[0].[0].arg[0].value.[1].modifier[2].arg[0].value", fallback: "r"))
            .chartYAxisLabel(__designTimeString("#24586.[2].[1].property.[0].[0].arg[0].value.[1].modifier[3].arg[0].value", fallback: "population"))
        }
    
#sourceLocation()
    }
}

import struct LogisticMapCharts_Combine.MetaLogisticMapView
import struct LogisticMapCharts_Combine.MetaLogisticMapView_Previews
