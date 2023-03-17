//
//  ComprehensiveLogisticMapViewModel.swift
//  LogisticMapCharts+Combine
//
//  Created by cbcmusic on 2023-03-12.
//

import Foundation
import Combine

class MetaLogisticMapModel: ObservableObject {
    @Published var initialX: Double {
        didSet {
            generateValues()
        }
    }
    var numSteps: Int = 200 {
        didSet {
            generateValues()
        }
    }
    @Published var minR: Double = 2.0
    @Published var maxR: Double = 4.0
    
    @Published var slices: [LogisticSlice] = []

    let numBuckets: Int = 650 // 303

    init(initialX: Double = 0.3, numSteps: Int = 300) {
        self.initialX = initialX
        self.numSteps = numSteps
        
        generateValues()
        
    }
    
    func generateValues() {
        let rVals = createRValArray(start: minR, end: maxR, steps: 700)
        
        let newSlices = rVals.map {
            createSlice(initialX: 0.5, rVal: $0, numSteps: numSteps)
        }
        slices = newSlices
    }
    
    private func createRValArray(start: Double, end: Double, steps: Double) -> [Double] {
        let interval = (end - start) / steps
        var r = start
        var rVals = [start]
        while r < end {
            r += interval
            rVals.append(r)
        }
        return rVals
    }
    
    
    private func generateNextValue(xVal: Double, rVal: Double) -> Double {
        guard xVal >= 0 else { return 0 }
        guard xVal <= 1 else { return 1 }
        return xVal * rVal * (1 - xVal)
    }
        
    func createSlice(initialX: Double, rVal: Double, numSteps: Int) -> LogisticSlice {
        // get the xVals
        var valuesOverTime = [initialX]
        (0...numSteps).forEach { _ in
            if let last = valuesOverTime.last {
                valuesOverTime.append(generateNextValue(xVal: last, rVal: rVal))
            }
        }
        
        // create empty buckets
        var buckets = (0..<numBuckets).map {
            BucketPoint(xVal: Double($0) * (1/Double(numBuckets)), value: 0)
        }
        
        // fill buckets with x values
        for value in valuesOverTime[30...] {
            let bucketIndex = Int((value * Double(numBuckets)).rounded(.down))
            if (0..<numBuckets) ~= bucketIndex {
                buckets[bucketIndex].value += (1 / Double(numSteps))
            }
        }
    
        return LogisticSlice(rVal: rVal, buckets: buckets.filter { $0.value > 0} )
    }
    
    struct LogisticSlice: Hashable, Identifiable {
        let rVal: Double
        var buckets: [BucketPoint]
        
        var id: Double { rVal }
    }
    
    struct BucketPoint: Identifiable, Equatable, Hashable {
        let xVal: Double
        var value: Double
        
        var id: Double { xVal }
    }
}

