//
//  ContentView.swift
//  LogisticMapCharts
//
//  Created by cbcmusic on 2022-10-10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RValueChartsView()
                .tabItem {
                    Text("variable r-values")}
            MetaLogisticMapView()
                .tabItem {Text("all r-values")}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
