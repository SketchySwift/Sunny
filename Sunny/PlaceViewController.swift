//
//  PlaceViewController.swift
//  Sunny
//
//  Created by Abdurrahman on 12/21/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit
import MapKit

class PlaceViewController: UIViewController, MKMapViewDelegate {

	@IBOutlet weak var map: MKMapView!
	
	@IBAction func backButton(sender: AnyObject) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		setLocation()
	}

	func setLocation() {
		// 38.903780, -77.036466
		let latitude = 38.903780
		let longitude = -77.036466
		
		let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
		
		let latDelta: CLLocationDegrees = 0.04
		let lonDelta: CLLocationDegrees = 0.04
		
		let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
		
		let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
		map.setRegion(region, animated: true)
		
		let annotation = MKPointAnnotation()
		annotation.coordinate = location
		annotation.title = "Washington DC"
		map.addAnnotation(annotation)
		
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
