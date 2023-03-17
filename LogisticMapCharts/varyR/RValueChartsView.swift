//
//  TestView.swift
//  LogisticMapCharts
//
//  Created by cbcmusic on 2022-10-10.
//

import SwiftUI
import Charts

struct RValueChartsView: View {
    @ObservedObject var model = LogisticMapModel()
    @State var rVal: Double = 3.0
    @State var sliderRange: ClosedRange<Double> = 1...4
    @State var initialValue = 0.5
    @State var numSteps: Double = 100
    @State var chartType: ChartType = .line
    let numStepsRange: ClosedRange<Int> = 50...2000
    
    enum ChartType: String, CaseIterable {
        case line
        case point
        case bucket
    }
    var body: some View {
        VStack {
            Picker("Chart Type", selection: $chartType) {
                ForEach(ChartType.allCases, id: \.self) { chartType in
                    Text(chartType.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack {
                Slider(value: $initialValue, in: 0...1) {
                    Text("initial x: \(initialValue, specifier: "%.03f")")
                }
                .frame(width: 400)
                .rotationEffect(.degrees(-90))
                .padding()
                .frame(width: 40)
                .alignmentGuide(VerticalAlignment.center) {$0[VerticalAlignment.center] }
                VStack(alignment: .leading) {
                    Text("Num steps: \(numSteps, specifier: "%.0f")")
                        .font(.caption)
                    Slider(value: $numSteps, in: 50...2000) {
                        Text("Num steps: \(numSteps)")
                    }
                    .padding()
                    selectedChart()
                    Text("r = \(model.rVal)")
                        .font(.caption)
                        .fontWeight(.bold)
                    Slider(value:  $rVal, in: sliderRange,
                           label: { Text("r = \(model.rVal)") },
                           minimumValueLabel: {
                        Text("\(sliderRange.lowerBound, specifier: "%.3f")")
                        .font(.caption)
                    },
                           maximumValueLabel: {
                        Text("\(sliderRange.upperBound, specifier: "%.3f")")
                        .font(.caption)
                        
                    })
                    RangedSliderView(value: $sliderRange,
                                     bounds: (1...4))
                    .padding()
                    .onChange(of: rVal) {
                        model.rVal = $0
                        updateBucketsIfNecessary()
                    }
                    .onChange(of: initialValue) {
                        model.initialX = $0
                        updateBucketsIfNecessary()
                    }
                    .onChange(of: numSteps) {
                        model.numSteps = Int($0)
                        updateBucketsIfNecessary()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func selectedChart() -> some View {
        switch chartType {
        case .line:
            LineChart(model: model)
        case .point:
            PointChart(model: model)
        case .bucket:
            BucketChart(model: model)
        }
    }
    
    func updateBucketsIfNecessary() {
        if chartType == .bucket {
            model.createBuckets()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        RValueChartsView()
    }
}



