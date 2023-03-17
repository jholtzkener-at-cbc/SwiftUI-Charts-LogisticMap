@_private(sourceFile: "RValueChartsView.swift") import LogisticMapCharts_Combine
import SwiftUI
import SwiftUI
import Charts

extension TestView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/varyR/RValueChartsView.swift", line: 113)
        RValueChartsView()
    
#sourceLocation()
    }
}

extension RValueChartsView {
    @_dynamicReplacement(for: updateBucketsIfNecessary()) private func __preview__updateBucketsIfNecessary() {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/varyR/RValueChartsView.swift", line: 105)
        if chartType == .bucket {
            model.createBuckets()
        }
    
#sourceLocation()
    }
}

extension RValueChartsView {
    @_dynamicReplacement(for: selectedChart()) @ViewBuilder private func __preview__selectedChart() -> some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/varyR/RValueChartsView.swift", line: 94)
        switch chartType {
        case .line:
            LineChart(model: model)
        case .point:
            PointChart(model: model)
        case .bucket:
            BucketChart(model: model)
        }
    
#sourceLocation()
    }
}

extension RValueChartsView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/varyR/RValueChartsView.swift", line: 26)
        VStack {
            Picker(__designTimeString("#24219.[2].[8].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Chart Type"), selection: $chartType) {
                ForEach(ChartType.allCases, id: \.self) { chartType in
                    Text(chartType.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack {
                Slider(value: $initialValue, in: __designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0]", fallback: 0)...__designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[1]", fallback: 1)) {
                    Text("initial x: \(initialValue, specifier: __designTimeString("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[2].value.[0].arg[0].value.[1].value.arg[1].value", fallback: "%.03f"))")
                }
                .frame(width: __designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[0].arg[0].value", fallback: 400))
                .rotationEffect(.degrees(__designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value", fallback: -90)))
                .padding()
                .frame(width: __designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value", fallback: 40))
                .alignmentGuide(VerticalAlignment.center) {$0[VerticalAlignment.center] }
                VStack(alignment: .leading) {
                    Text("Num steps: \(numSteps, specifier: __designTimeString("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value.[1].value.arg[1].value", fallback: "%.0f"))")
                        .font(.caption)
                    Slider(value: $numSteps, in: __designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[1].arg[1].value.[0]", fallback: 50)...__designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[1].arg[1].value.[1]", fallback: 2000)) {
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
                        Text("\(sliderRange.lowerBound, specifier: __designTimeString("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[4].arg[3].value.[0].arg[0].value.[1].value.arg[1].value", fallback: "%.3f"))")
                        .font(.caption)
                    },
                           maximumValueLabel: {
                        Text("\(sliderRange.upperBound, specifier: __designTimeString("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[4].arg[4].value.[0].arg[0].value.[1].value.arg[1].value", fallback: "%.3f"))")
                        .font(.caption)
                        
                    })
//                    
//                    Slider(value: $rVal, label:{ Text("r = \(model.rVal)") },
//                           minimumValueLabel: {Text("\(sliderRange.lowerBound, specifier: "%.3f")")
//                        .font(.caption)},
//                           maximumValueLabel: {Text("\(sliderRange.upperBound, specifier: "%.3f")")
//                        .font(.caption)}, in: sliderRange)
                    RangedSliderView(value: $sliderRange,
                                     bounds: (__designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[5].arg[1].value.[0].[0]", fallback: 1)...__designTimeInteger("#24219.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[1].value.[5].arg[1].value.[0].[1]", fallback: 4)))
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
    
#sourceLocation()
    }
}

import struct LogisticMapCharts_Combine.RValueChartsView
import struct LogisticMapCharts_Combine.TestView_Previews
