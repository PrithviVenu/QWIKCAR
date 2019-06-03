//
//  BookingPresentationContract.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 13/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation

protocol BookingViewContract:AnyObject{
    func onSuccess(cars:[Car])
    func onFailure()
}
