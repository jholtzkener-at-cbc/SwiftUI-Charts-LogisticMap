//
//  BucketChartswift.swift
//  LogisticMapCharts+Combine
//
//  Created by cbcmusic on 2023-03-11.
//

import SwiftUI
import Charts

struct BucketChart: View {
    @ObservedObject var model = LogisticMapModel()
    
    var body: some View {
        Chart {
            ForEach(Array(model.buckets.enumerated()), id: \.element) { offset, element in
                BarMark(x: .value("bucket", Double(offset)/Double(model.numBuckets)),
                         y: .value("number of values", element))
            }
        }
        .chartYScale(domain: (0...model.numSteps))
        .chartXScale(domain: 0...1.0)
        .layoutPriority(2)
        .onAppear {
            model.createBuckets()
        }
    }
}

struct BucketChartswift_Previews: PreviewProvider {
    static var previews: some View {
        BucketChart()
    }
}
