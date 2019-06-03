//
//  GetBookingDataContract.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 15/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
protocol  GetBookingDataContract {
func getAvailableCars(startDate: String, endDate: String, map: [String : [String]])->[Car]
func getBranches()->[String]
func getSeaterTypes()->[String]
}

