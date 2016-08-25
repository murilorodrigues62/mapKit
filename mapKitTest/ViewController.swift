//
//  ViewController.swift
//  mapKitTest
//
//  Created by ifsp on 19/08/16.
//  Copyright © 2016 IFSP. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        mapView.delegate = self
        
        let berlin = MKCoordinateRegionMake(CLLocationCoordinate2DMake            (52.52007, 13.404954),                                            MKCoordinateSpanMake(0.1766154, 0.153035))
                
        mapView.setRegion(berlin, animated: true)
        
        cameraSetup()
    }
    
    private func cameraSetup(){
        mapView.camera.altitude = 1400
        mapView.camera.pitch = 50
        mapView.camera.heading = 180
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentControlChanged(sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 1:
            mapView.mapType = MKMapType.SatelliteFlyover
        case 2:
            mapView.mapType = MKMapType.HybridFlyover
        default:
            mapView.mapType = MKMapType.Standard
        }
    }
    
    @IBAction func trafficBtn(sender: AnyObject) {
        mapView.showsTraffic = !mapView.showsTraffic
        if mapView.showsTraffic == true {
            sender.setTitle("Hide traffic", forState: UIControlState.Normal)
        }
        else {
            sender.setTitle("Show traffic", forState: UIControlState.Normal)
            
        }
    }
    
    @IBAction func compassBtn(sender: AnyObject) {
        mapView.showsCompass = !mapView.showsCompass
        if mapView.showsCompass == true {
            sender.setTitle("Hide Compass", forState: UIControlState.Normal)
        }
        else {
            sender.setTitle("Show Compass", forState: UIControlState.Normal)
        }
    }
}
