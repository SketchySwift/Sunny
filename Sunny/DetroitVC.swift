//
//  DetroitVC.swift
//  Sunny
//
//  Created by Abdurrahman on 12/21/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit
import SystemConfiguration
//import SwiftSpinner

class DetroitVC: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
//	var customIND: SwiftNotice?
//	var weather: DetroitVC!
//	
//	@IBOutlet weak var backgroundImg: UIImageView!
//	@IBOutlet weak var temperatureLabel: UILabel!
//	@IBOutlet weak var mainDescriptionLabel: UILabel!
//	@IBOutlet weak var humidLabel: UILabel!
//	@IBOutlet weak var windSpeed: UILabel!
//	@IBOutlet weak var windPressureLabel: UILabel!
//	@IBOutlet weak var sunriseTimeLabel: UILabel!
//	@IBOutlet weak var sunsetTimeLabel: UILabel!
//	@IBOutlet weak var maxMinTempLabel: UILabel!
//	@IBOutlet weak var fullDescriptionLabel: UILabel!
//	@IBOutlet weak var windDirectionLabel: UILabel!
//	@IBOutlet weak var dateLabel: UILabel!
//	@IBOutlet weak var weatherImage: UIImageView!
//	
//	@IBOutlet weak var refreshButtonOutlet: UIButton!
//	
//	var wifiCheck: Reachability?
//	
//	func seeIfUsersWifiIsOn() {
//		if Reachability.isConnectedToNetwork() == false {
//			showAlert("Could not retrieve data", message: "Make sure your internet connection is on", closeButton: "Ok")
//		} else {
//			updateUI()
//		}
//		
//	}
//	override func viewWillAppear(animated: Bool) {
//		seeIfUsersWifiIsOn()
//	}
//	
//	@IBAction func refreshButton(sender: AnyObject) {
//		if Reachability.isConnectedToNetwork() == false {
//			self.noticeTop("Error!", autoClear: true, autoClearTime: 1)
//			self.noticeError("Try Again!", autoClear: true, autoClearTime: 1)
//			//showAlert("Internet Connection Problem", message: "Perhas something maybe wrong with the internet connection, make sure that you're Wi-Fi is turned on. Try again!", closeButton: "OK")
//		} else {
//			updateUI()
//			self.noticeTop("Updated!", autoClear: true, autoClearTime: 1)
//			self.noticeSuccess("Success!", autoClear: true, autoClearTime: 1)
//			//self.noticeInfo("Info", autoClear: true, autoClearTime: 10)
//		}
//	}
//	
//	override func pleaseWait() {
//		
//	}
//	
//	// Create a function for an alert that can always be re-used
//	func showAlert(title: String, message: String, closeButton: String) {
//		let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
//		let alertAction = UIAlertAction(title: closeButton, style: .Default, handler: nil)
//		alertController.addAction(alertAction)
//		self.presentViewController(alertController, animated: true, completion: nil)
//	}
//	
//	// MARK: Properties
//	//	var windDir: Weather?
//	
//	//	let N = Weather.windDirections.N
//	//	let NNE = Weather.windDirections.NNE
//	//	let NE = Weather.windDirections.NE
//	//	let ENE = Weather.windDirections.ENE
//	//	let E = Weather.windDirections.E
//	//	let ESE = Weather.windDirections.ESE
//	//	let SE = Weather.windDirections.SE
//	//	let SSE = Weather.windDirections.SSE
//	//	let S = Weather.windDirections.S
//	//	let SSW = Weather.windDirections.SSE
//	//	let SW = Weather.windDirections.SW
//	//	let WSW = Weather.windDirections.WSW
//	//	let W = Weather.windDirections.W
//	//	let WNW = Weather.windDirections.WNW
//	//	let NW = Weather.windDirections.NW
//	//	let NNW = Weather.windDirections.NNW
//	
//	var _windDirection: detroitWindDirections?
//	
//	var windDirection: detroitWindDirections {
//		get {
//			if _windDirection == nil {
//				return detroitWindDirections.N
//			} else {
//				return _windDirection!
//			}
//		}
//	}
//	
//	//	var weatherIcon: String {
//	//		get {
//	//			if weather == nil {
//	//				return weather.icon
//	//			} else {
//	//				return weather.icon
//	//			}
//	//		}
//	//	}
//	
//	enum detroitWindDirections {
//		case N
//		case NNE
//		case NE
//		case ENE
//		case E
//		case ESE
//		case SE
//		case SSE
//		case S
//		case SSW
//		case SW
//		case WSW
//		case W
//		case WNW
//		case NW
//		case NNW
//	}
//	
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		// Do any additional setup after loading the view, typically from a nib.
//		seeIfUsersWifiIsOn()
//		updateUI()
//		//		windDir?.updateTheWindDir()
//		
//		//let date = NSDate(timeIntervalSince1970: 1450614168)
//		//print(date)
//		
//		//		windDirectionLabel.text = "\(windDir?._windDirect)"
//		
//		//		print(windDir?._windDirect)
//		//		print(windDir?.updateTheWindDir())
//		
//	}
//	
//	func convertMillibarsToInches(pressure: Double) -> Double {
//		return pressure * 0.0295333727
//	}
//	
//	func updateUI() {
//		//let urlString = "http://api.openweathermap.org/data/2.5/weather?id=4787117,uk&appid=2de143494c0b295cca9337e1e96b00e0"
//		
//		let urlString = "http://api.openweathermap.org/data/2.5/weather?zip=48201,us&appid=2de143494c0b295cca9337e1e96b00e0"
//		
//		let session = NSURLSession.sharedSession()
//		
//		if let url = NSURL(string: urlString) {
//			
//			session.dataTaskWithURL(url) { (data, response, error) -> Void in
//				
//				if let responseData = data {
//					
//					do {
//						let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
//						
//						if let dict = json as? Dictionary <String, AnyObject> {
//							
//							if let main = dict["main"] as? NSDictionary {
//								if let temp = main["temp"] as? Float  {
//									let fehr = Int((temp - 273.15) * 1.8 + 32.00)
//									
//									dispatch_async(dispatch_get_main_queue(), {
//										self.temperatureLabel.text = "\(fehr)°"
//									})
//									
//									print(fehr)
//								}
//								
//								if let pressure = main["pressure"] as? Double {
//									let converted = self.convertMillibarsToInches(pressure)
//									dispatch_async(dispatch_get_main_queue(), {
//										//self.windPressureLabel.text = "\(self.convertMillibarsToInches(pressure))"
//										self.windPressureLabel.text = NSString(format: "%.2f", self.convertMillibarsToInches(pressure)) as String
//									})
//									print(converted)
//								}
//								
//								// here
//								if  let maxTemp = main["temp_max"] as? Double, let minTemp = main["temp_min"] as? Double {
//									// (temp - 273.15) * 1.8 + 32.00
//									let min = Int((minTemp - 273.15) * 1.8 + 32.00)
//									let max = Int((maxTemp - 273.15) * 1.8 + 32.00)
//									dispatch_async(dispatch_get_main_queue(), {
//										self.maxMinTempLabel.text = "\(min)°/ \(max)°"
//									})
//									print("\(max)°/ \(min)°")
//								}
//								
//								
//								
//							}// END of: if let main for temperature
//							
//							if let main = dict["main"] as? Dictionary <String, AnyObject> {
//								if let humid = main["humidity"] as? Int {
//									dispatch_async(dispatch_get_main_queue(), {
//										self.humidLabel.text = "\(humid)%"
//									})
//									print(humid)
//								}
//							}// END of: if let main for humidity
//							
//							if let weatherDescription = dict["weather"] as? [Dictionary <String, AnyObject>] where weatherDescription.count > 0 {
//								if let description = weatherDescription[0]["main"] as? String {
//									dispatch_async(dispatch_get_main_queue(), {
//										self.mainDescriptionLabel.text = "\(description.capitalizedString)"
//									})
//									print(description)
//								}// END main title check
//								
//								if let description = weatherDescription[0]["description"] as? String {
//									dispatch_async(dispatch_get_main_queue(), {
//										self.fullDescriptionLabel.text = "\(description.capitalizedString)"
//									})
//									print(description)
//								}// END full title check
//								
//								//Icon
//								
//								if let icon = weatherDescription[0]["icon"] as? String {
//									
//									dispatch_async(dispatch_get_main_queue(), {
//										self.weatherImage.image = UIImage(named: icon)
//										
//										switch (icon) {
//										case "9n", "10n", "11n", "13n", "50n":
//											self.backgroundImg.image = UIImage(named: "night")
//											self.refreshButtonOutlet.setImage(UIImage(named: "Refresh icon3"), forState: .Normal)
//										case "01n", "02n", "03n", "04n":
//											self.backgroundImg.image = UIImage(named: "BG2")
//											self.refreshButtonOutlet.setImage(UIImage(named: "Refresh icon2"), forState: .Normal)
//										case "01d", "02d":
//											self.backgroundImg.image = UIImage(named: "BG3")
//											self.refreshButtonOutlet.setImage(UIImage(named: "Refresh icon4"), forState: .Normal)
//										case  "03d", "04d":
//											self.backgroundImg.image = UIImage(named: "BG4")
//											self.refreshButtonOutlet.setImage(UIImage(named: "Refresh icon5"), forState: .Normal)
//										case "09d", "10d", "11d", "13d", "50d":
//											self.backgroundImg.image = UIImage(named: "BG")
//											self.refreshButtonOutlet.setImage(UIImage(named: "Refresh icon"), forState: .Normal)
//										default:
//											self.backgroundImg.image = UIImage(named: "BG")
//											self.refreshButtonOutlet.setImage(UIImage(named: "Refresh icon"), forState: .Normal)
//										}
//									})
//									
//									//									switch (icon) {
//									//
//									//									case "01d", "01n":
//									//										self.backgroundImg.image = UIImage(named: "ClearBG")
//									//									case "02d", "02n", "03d", "03n", "04d", "04n":
//									//										self.backgroundImg.image = UIImage(named: "CloudyBG")
//									//									case "09d", "09n", "10d", "10n", "11d", "11n", "50d", "50n":
//									//										self.backgroundImg.image = UIImage(named: "RainyBG")
//									//									case "13d", "13n":
//									//										self.backgroundImg.image = UIImage(named: "SnowyBG")
//									//									default:
//									//										self.backgroundImg.image = UIImage(named: "ClearBG")
//									
//									
//								}
//								
//								
//							} // END of: if let weather for descriptioon
//							
//							if let wind = dict["wind"] as? Dictionary <String, AnyObject> {
//								if let speed = wind["speed"] as? Double {
//									dispatch_async(dispatch_get_main_queue(), {
//										self.windSpeed.text = "\(speed) mph"
//									})
//									
//								} // END OF IF LET SPEED
//								
//								if let direction = wind["deg"] as? Double {
//									dispatch_async(dispatch_get_main_queue(), {
//										self.windDirectionLabel.text = "\(self.windDirection)"
//										print("Wind is \(self.windDirection)")
//									})
//									
//									switch (direction) {
//										
//									case 348.75...360:
//										self._windDirection = detroitWindDirections.N
//										
//									case 0..<11.25:
//										self._windDirection = detroitWindDirections.N
//										
//									case 11.25..<33.75:
//										self._windDirection = detroitWindDirections.NNE
//										
//									case 33.75..<56.25:
//										self._windDirection = detroitWindDirections.NE
//										
//									case 56.25..<78.75:
//										self._windDirection = detroitWindDirections.ENE
//										
//									case 78.75..<101.25:
//										self._windDirection = detroitWindDirections.E
//										
//									case 101.25..<123.75:
//										self._windDirection = detroitWindDirections.ESE
//										
//									case 123.75..<146.25:
//										self._windDirection = detroitWindDirections.SE
//										
//									case 146.25..<168.75:
//										self._windDirection = detroitWindDirections.SSE
//										
//									case 168.75..<191.25:
//										self._windDirection = detroitWindDirections.S
//										
//									case 191.25..<213.75:
//										self._windDirection = detroitWindDirections.SSW
//										
//									case 213.75..<236.25:
//										self._windDirection = detroitWindDirections.SW
//										
//									case 236.25..<258.75:
//										self._windDirection = detroitWindDirections.WSW
//										
//									case 258.75..<281.25:
//										self._windDirection = detroitWindDirections.W
//										
//									case 281.25..<303.75:
//										self._windDirection = detroitWindDirections.WNW
//										
//									case 303.75..<326.25:
//										self._windDirection = detroitWindDirections.NW
//										
//									case 326.25..<348.75:
//										self._windDirection = detroitWindDirections.NNW
//										
//									default:
//										self._windDirection = detroitWindDirections.N
//										
//									}
//									
//								} // End of if let direction
//								
//							}// END Of if let wind
//							
//							if let sysDetl = dict["sys"] as? Dictionary <String, AnyObject> {
//								if let sunrise = sysDetl["sunrise"] as? Double {
//									var date = NSDate(timeIntervalSince1970: sunrise)
//									let timeFormatter = NSDateFormatter()
//									timeFormatter.dateFormat = "h:mma"
//									dispatch_async(dispatch_get_main_queue(), {
//										self.sunriseTimeLabel.text = timeFormatter.stringFromDate(date)
//									})
//								}
//								
//								if let sunset = sysDetl["sunset"] as? Double {
//									let date = NSDate(timeIntervalSince1970: sunset)
//									let timeFormatter = NSDateFormatter()
//									timeFormatter.dateFormat = "h:mma"
//									dispatch_async(dispatch_get_main_queue(), {
//										self.sunsetTimeLabel.text = timeFormatter.stringFromDate(date)
//									})
//									
//								}
//							}
//							
//							
//							if let date = dict["dt"] as? Double {
//								let date = NSDate(timeIntervalSince1970: date)
//								let dayFormatter = NSDateFormatter()
//								let dateFormatter = NSDateFormatter()
//								let timeFormatter = NSDateFormatter()
//								dayFormatter.dateFormat = "EEEE"
//								timeFormatter.dateStyle = .LongStyle
//								dateFormatter.dateStyle = .LongStyle
//								timeFormatter.dateFormat = "h:mm s"
//								var timeLabel = dayFormatter.stringFromDate(date)
//								var dayLabel = dateFormatter.stringFromDate(date)
//								//self.dayLabel = timeFormatter.stringFromDate(date)
//								
//								dispatch_async(dispatch_get_main_queue(), {
//									self.dateLabel.text = "\(timeLabel) \(dayLabel)"
//								})
//								
//							}
//							
//							//							self.updateBackgroundImage()
//							
//							/*
//							if date == NSDate(timeIntervalSinceReferenceDate: 1450648215) {
//							dispatch_async(dispatch_get_main_queue(), {
//							self.backgroundImg.image = UIImage(named: "night")
//							})
//							}
//							*/
//							
//						} //ENDDDD::::::: STOP
//						
//						print(json)
//					} catch let err as NSError {
//						print(err)
//					}
//				}
//				}.resume()
//		}
//	}
//	
//	
//	override func preferredStatusBarStyle() -> UIStatusBarStyle {
//		return .LightContent
//	}
	
	
}
