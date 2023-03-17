//
//  LogisticMapModel.swift
//  LogisticMapCharts
//
//  Created by cbcmusic on 2022-10-10.
//

import Foundation
import Combine

class LogisticMapModel: ObservableObject {
    @Published var initialX: Double {
        didSet {
            generateValues()
        }
    }
    @Published var numSteps: Int = 100 {
        didSet {
            generateValues()
        }
    }
    
    @Published var rVal: Double {
        didSet {
            generateValues()
        }
    }
    @Published var xVals: [Double] = []
    @Published var buckets: [Int] = []
    let numBuckets: Int = 100
    var pub = PassthroughSubject<[Double], Never>()
    var sub = Set<AnyCancellable>()
    
    init(initialX: Double = 0.3, rVal: Double = 3.56) {
        self.initialX = initialX
        self.rVal = rVal
        
        pub.assign(to: \.xVals, on: self)
            .store(in: &sub)
        
        generateValues()
    }
    
    private func generateValues() {
        var vals = [initialX]
        (0 ..< numSteps).forEach { _ in
            vals.append(generateNextValue(vals.last!))
        }
        pub.send(vals)
    }
    
    func createBuckets() {
        var buckets = Array.init(repeating: 0, count: numBuckets)
        for val in xVals[50...] {
            let bucket =  Int((val * Double(numBuckets)).rounded(.down))
            if bucket < numBuckets {
                buckets[bucket] += 1
            }
        }
        
        self.buckets = buckets
    }
    
    
    
    private func generateNextValue(_ xVal: Double) -> Double {
        return xVal * rVal * (1 - xVal)
    }
}
