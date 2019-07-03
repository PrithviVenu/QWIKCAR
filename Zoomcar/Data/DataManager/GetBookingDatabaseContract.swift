//
//  GetBookingDatabaseContract.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 15/03/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Foundation
protocol GetBookingDatabaseContract{
func listAvailableCars(startDate: String, endDate: String, map: [String : [String]])->[Car]
func getBranches()->[String]
func getSeaterTypes()->[String]
func applyOffer(offerCode:String)->Int?
func upcomingBookings(date:String,userId:String)->[BookingDetails]
func completedBookings(date:String,userId:String)->[BookingDetails]
func authenticate(userEmail:String,password:String)->Int
func bookAndPay(bookingDetail:BookingDetails)
func getWalletBalance(userID:Int)->Int
func payWithWalletMoney(amount:Int,userId:Int)
}
