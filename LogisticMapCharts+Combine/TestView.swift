//
//  TestView.swift
//  LogisticMapCharts+Combine
//
//  Created by cbcmusic on 2022-10-10.
//

import SwiftUI
import Charts

struct TestView: View {
    @ObservedObject var model = LogisticMapModel()
    @State var sliderVal: Double = 3.0
    @State var sliderRange: ClosedRange<Double> = 1...4
    @State var initialValue = 0.5
    @State var numSteps: Double = 2000
    @State var chartType: ChartType = .line
    let numStepsRange: ClosedRange<Int> = 50...2000
    
    enum ChartType: String, CaseIterable {
        case line
        case point
        case bucket
    }
    var body: some View {
        HStack {
            Slider(value: $initialValue, in: 0...1)
                .frame(width: 400)
                .rotationEffect(.degrees(-90))
                .padding()
                .frame(width: 40)
                .alignmentGuide(VerticalAlignment.center) {$0[VerticalAlignment.center] }
            VStack {
                Picker("Chart Type", selection: $chartType) {
                    ForEach(ChartType.allCases, id: \.self) { chartType in
                        Text(chartType.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                Slider(value: $numSteps, in: 50...2000)
                    .padding()
                switch chartType {
                case .line:
                    LineChart(model: model)
                case .point:
                    PointChart(model: model)
                case .bucket:
                    BucketChart(model: model)
                }
                Text("r = \(model.rVal)")
                Slider(value: $sliderVal, in: sliderRange)
                    .padding()
                RangedSliderView(value: $sliderRange,
                                 bounds: (1...4))
                .padding()
                .onChange(of: sliderVal) {
                    model.rVal = $0
                    if chartType == .bucket {
                        model.createBuckets()
                    }
                }
                .onChange(of: initialValue) {
                    model.initialX = $0
                    if chartType == .bucket {
                        model.createBuckets()
                    }
                }
                .onChange(of: numSteps) {
                    model.numSteps = Int($0)
                    if chartType == .bucket {
                        model.createBuckets()
                    }
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}



