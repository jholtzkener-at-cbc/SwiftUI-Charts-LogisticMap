//
//  MetaLogisticMapView.swift
//  LogisticMapCharts+Combine
//
//  Created by cbcmusic on 2023-03-12.
//

import SwiftUI
import Charts

struct MetaLogisticMapView: View {
    @ObservedObject var model = MetaLogisticMapModel()
    var body: some View {
        VStack {
            Text("Logistic Map - Behaviour across r-values")
            Chart {
                ForEach(model.slices) { slice in
                    ForEach(slice.buckets) { bucket in
                        PointMark(x: .value("r-value", slice.rVal),
                                  y: .value("x-value", bucket.xVal))
                        .foregroundStyle(.opacity(setOpacity(val: bucket.value)))
                        .symbolSize(5)
                    }
                }
            }
            .padding()
            .chartXScale(domain: model.minR...model.maxR)
            .chartXAxisLabel("r")
            .chartYAxisLabel("population")
        }
    }
    
    func setOpacity(val: Double) -> Double {
        
        let newVal = (val + 0.08) * 2
        return min(1, newVal)
    }
}

struct MetaLogisticMapView_Previews: PreviewProvider {
    static var previews: some View {
        MetaLogisticMapView()
    }
}
