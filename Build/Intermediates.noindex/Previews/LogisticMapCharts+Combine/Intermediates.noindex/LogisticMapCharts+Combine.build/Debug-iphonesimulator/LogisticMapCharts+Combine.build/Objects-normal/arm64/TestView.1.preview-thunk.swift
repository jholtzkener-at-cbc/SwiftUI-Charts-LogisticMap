@_private(sourceFile: "TestView.swift") import LogisticMapCharts_Combine
import SwiftUI
import SwiftUI
import Charts

extension TestView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/TestView.swift", line: 90)
        TestView()
    
#sourceLocation()
    }
}

extension TestView {
    @_dynamicReplacement(for: selectedChart()) @ViewBuilder private func __preview__selectedChart() -> some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/TestView.swift", line: 77)
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

extension TestView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/TestView.swift", line: 26)
        VStack {
            Picker(__designTimeString("#9955.[2].[8].property.[0].[0].arg[0].value.[0].arg[0].value", fallback: "Chart Type"), selection: $chartType) {
                ForEach(ChartType.allCases, id: \.self) { chartType in
                    Text(chartType.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack {
                Slider(value: $initialValue, in: __designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0]", fallback: 0)...__designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[1]", fallback: 1))
                    .frame(width: __designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[0].arg[0].value", fallback: 400))
                    .rotationEffect(.degrees(__designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value", fallback: -90)))
                    .padding()
                    .frame(width: __designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[0].modifier[3].arg[0].value", fallback: 40))
                    .alignmentGuide(VerticalAlignment.center) {$0[VerticalAlignment.center] }
                VStack {
                    Slider(value: $numSteps, in: __designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0]", fallback: 50)...__designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].arg[1].value.[1]", fallback: 2000))
                        .padding()
                   selectedChart()
                    Text("r = \(model.rVal)")
                    Slider(value: $sliderVal, in: sliderRange)
                        .padding()
                    RangedSliderView(value: $sliderRange,
                                     bounds: (__designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[4].arg[1].value.[0].[0]", fallback: 1)...__designTimeInteger("#9955.[2].[8].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[4].arg[1].value.[0].[1]", fallback: 4)))
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
    
#sourceLocation()
    }
}

import struct LogisticMapCharts_Combine.TestView
import struct LogisticMapCharts_Combine.TestView_Previews
