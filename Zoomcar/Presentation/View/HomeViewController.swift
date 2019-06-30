//
//  HomeViewController.swift
//  Zoomcar
//
//  Created by prithvi-pt2335 on 14/05/19.
//  Copyright © 2019 prithvi-pt2335. All rights reserved.
//

import Cocoa

class HomeViewController: NSViewController {
   
    @IBOutlet weak var containerView: NSView!
    override func viewDidLoad() {
        super.viewDidLoad()
        SideViewController.home=self
        mainVC()

        // Do view setup here.
    }
    
//    func mainVC(){
//        let vc = storyboard?.instantiateController(withIdentifier: "viewController") as! ViewController
//        var i = 0
//        for subview in containerView.subviews {
//            removeChild(at: i)
//            i+=1
//            subview.removeFromSuperview()
//        }
//        addChild(vc)
//        containerView.addSubview(vc.view)
//        NSLayoutConstraint.activate([
//            vc.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
//            vc.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
//            vc.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
//            vc.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
//            ])
//
//        vc.view.translatesAutoresizingMaskIntoConstraints = false
//    }
    func mainVC(){
        let vc = ViewController1()
        vc.homevc=self
        var i = 0
        for subview in containerView.subviews {
            removeChild(at: i)
            i+=1
            subview.removeFromSuperview()
        }
        addChild(vc)
        containerView.addSubview(vc.view)
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            vc.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            vc.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            vc.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func confirmationVC(bookingView:BookingView)
    {
        let confirmationPage = ConfirmationViewController()
        confirmationPage.bookingView=bookingView
        var i = 0
        for subview in containerView.subviews {
            removeChild(at: i)
            i+=1
            subview.removeFromSuperview()
        }
        addChild(confirmationPage)
        containerView.addSubview(confirmationPage.view)
        NSLayoutConstraint.activate([
            confirmationPage.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            confirmationPage.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            confirmationPage.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            confirmationPage.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
        confirmationPage.view.translatesAutoresizingMaskIntoConstraints = false
    }
    func BookingInvoiceVC(rideDetail:BookingDetails)
    {
        let bookingInvoicePage = BookingInvoiceViewController()
        bookingInvoicePage.bookingDetail=rideDetail
        var i = 0
        for subview in containerView.subviews {
            removeChild(at: i)
            i+=1
            subview.removeFromSuperview()
        }
        addChild(bookingInvoicePage)
        containerView.addSubview(bookingInvoicePage.view)
        NSLayoutConstraint.activate([
            bookingInvoicePage.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            bookingInvoicePage.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            bookingInvoicePage.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            bookingInvoicePage.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
        bookingInvoicePage.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func CompletedInvoiceVC(rideDetail:BookingDetails)
    {
        let completedInvoicePage = CompletedRideBookingViewController()
        completedInvoicePage.bookingDetail=rideDetail
        var i = 0
        for subview in containerView.subviews {
            removeChild(at: i)
            i+=1
            subview.removeFromSuperview()
        }
        addChild(completedInvoicePage)
        containerView.addSubview(completedInvoicePage.view)
        NSLayoutConstraint.activate([
            completedInvoicePage.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            completedInvoicePage.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            completedInvoicePage.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            completedInvoicePage.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
        completedInvoicePage.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func paymentVC(bookingView:BookingView)
    {
        let paymentPage = PaymentViewController()
        paymentPage.bookingView=bookingView
        var i = 0
        for subview in containerView.subviews {
            removeChild(at: i)
            i+=1
            subview.removeFromSuperview()
        }
        addChild(paymentPage)
        containerView.addSubview(paymentPage.view)
        NSLayoutConstraint.activate([
            paymentPage.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            paymentPage.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            paymentPage.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            paymentPage.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
        paymentPage.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func yourRidesVC()
    {
         let yourRidesVC = storyboard?.instantiateController(withIdentifier: "yourRides") as! yourRidesViewController

        var i = 0
        for subview in containerView.subviews {
            removeChild(at: i)
            i+=1
            subview.removeFromSuperview()
        }
        addChild(yourRidesVC)
        containerView.addSubview(yourRidesVC.view)
        NSLayoutConstraint.activate([
            yourRidesVC.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            yourRidesVC.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            yourRidesVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            yourRidesVC.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
        yourRidesVC.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func carVC(bookingView:BookingView)
    {
        let carvc = storyboard?.instantiateController(withIdentifier: "car") as! CarViewController
        carvc.bookingView=bookingView
        var i = 0
        for subview in containerView.subviews {
            removeChild(at: i)
            i+=1
            subview.removeFromSuperview()
        }
        addChild(carvc)
        containerView.addSubview(carvc.view)
        NSLayoutConstraint.activate([
            carvc.view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            carvc.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            carvc.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            carvc.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)
            ])
        carvc.view.translatesAutoresizingMaskIntoConstraints = false

    }
    
}
