//
//  BinaryFloatingPointExtension.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 28/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

extension BinaryFloatingPoint {
    public func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        let divisor = Self((0..<places).reduce(1.0) { (accum, _) in 10.0 * accum })
        return (self * divisor).rounded() / divisor
    }
}
