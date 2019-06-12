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
         let vc = storyboard?.instantiateController(withIdentifier: "viewController") as! ViewController
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

        // Do view setup here.
    }
    
    func confirmationVC()
    {
        let confirmationPage = ConfirmationViewController()
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
