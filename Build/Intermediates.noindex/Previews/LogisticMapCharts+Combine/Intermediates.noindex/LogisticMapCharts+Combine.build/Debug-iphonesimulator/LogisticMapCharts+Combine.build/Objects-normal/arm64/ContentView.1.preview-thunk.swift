@_private(sourceFile: "ContentView.swift") import LogisticMapCharts_Combine
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/ContentView.swift", line: 24)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/cbcmusic/Documents/XcodeWorkspace/LogisticMapCharts+Combine/LogisticMapCharts+Combine/ContentView.swift", line: 12)
        TabView {
            RValueChartsView()
                .tabItem {
                    Text(__designTimeString("#9934.[1].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].arg[0].value", fallback: "Vary r-values"))}
            AllRValuesView()
                .tabItem {Text(__designTimeString("#9934.[1].[0].property.[0].[0].arg[0].value.[1].modifier[0].arg[0].value.[0].arg[0].value", fallback: "All r-values"))}
        }
    
#sourceLocation()
    }
}

import struct LogisticMapCharts_Combine.ContentView
import struct LogisticMapCharts_Combine.ContentView_Previews
