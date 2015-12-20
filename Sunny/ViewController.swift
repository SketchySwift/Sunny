//
//  ViewController.swift
//  Sunny
//
//  Created by Abdurrahman on 12/19/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var temperatureLabel: UILabel!
	@IBOutlet weak var mainDescriptionLabel: UILabel!
	@IBOutlet weak var humidLabel: UILabel!
	@IBOutlet weak var windSpeed: UILabel!
	@IBOutlet weak var windPressureLabel: UILabel!
	@IBOutlet weak var sunriseTimeLabel: UILabel!
	@IBOutlet weak var sunsetTimeLabel: UILabel!
	@IBOutlet weak var maxMinTempLabel: UILabel!
	@IBOutlet weak var fullDescriptionLabel: UILabel!
	@IBOutlet weak var windDirectionLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
	// MARK: Properties
	var windDir: Weather?
	
	let N = Weather.windDirections.N
	let NNE = Weather.windDirections.NNE
	let NE = Weather.windDirections.NE
	let ENE = Weather.windDirections.ENE
	let E = Weather.windDirections.E
	let ESE = Weather.windDirections.ESE
	let SE = Weather.windDirections.SE
	let SSE = Weather.windDirections.SSE
	let S = Weather.windDirections.S
	let SSW = Weather.windDirections.SSE
	let SW = Weather.windDirections.SW
	let WSW = Weather.windDirections.WSW
	let W = Weather.windDirections.W
	let WNW = Weather.windDirections.WNW
	let NW = Weather.windDirections.NW
	let NNW = Weather.windDirections.NNW
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		updateUI()
		windDir?.updateTheWindDir()
		
		//let date = NSDate(timeIntervalSince1970: 1450614168)
		//print(date)
		
		windDirectionLabel.text = "\(windDir?._windDirect)"
		
		print(windDir?._windDirect)
		print(windDir?.updateTheWindDir())
	}
	
	func convertMillibarsToInches(pressure: Double) -> Double {
		return pressure * 0.0295333727
	}

	func updateUI() {
		let urlString = "http://api.openweathermap.org/data/2.5/weather?id=4787117,uk&appid=2de143494c0b295cca9337e1e96b00e0"
		let session = NSURLSession.sharedSession()
		
		if let url = NSURL(string: urlString) {
			
			session.dataTaskWithURL(url) { (data, response, error) -> Void in
				
				if let responseData = data {
					
					do {
						let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
						
						if let dict = json as? Dictionary <String, AnyObject> {
						
							if let main = dict["main"] as? NSDictionary {
								if let temp = main["temp"] as? Float  {
									let fehr = Int((temp - 273.15) * 1.8 + 32.00)
									
									dispatch_async(dispatch_get_main_queue(), {
										self.temperatureLabel.text = "\(fehr)°"
									})
									
									print(fehr)
								}
								
								if let pressure = main["pressure"] as? Double {
									let converted = self.convertMillibarsToInches(pressure)
									dispatch_async(dispatch_get_main_queue(), {
										//self.windPressureLabel.text = "\(self.convertMillibarsToInches(pressure))"
										self.windPressureLabel.text = NSString(format: "%.2f", self.convertMillibarsToInches(pressure)) as String
									})
									print(converted)
								}
								
								// here
								if  let maxTemp = main["temp_max"] as? Double, let minTemp = main["temp_min"] as? Double {
									// (temp - 273.15) * 1.8 + 32.00
									let min = Int((minTemp - 273.15) * 1.8 + 32.00)
									let max = Int((maxTemp - 273.15) * 1.8 + 32.00)
									dispatch_async(dispatch_get_main_queue(), {
										self.maxMinTempLabel.text = "\(min)°/ \(max)°"
									})
									print("\(max)°/ \(min)°")
								}
								
								
								
							}// END of: if let main for temperature
							
							if let main = dict["main"] as? Dictionary <String, AnyObject> {
								if let humid = main["humidity"] as? Int {
									dispatch_async(dispatch_get_main_queue(), {
										self.humidLabel.text = "\(humid)%"
									})
									print(humid)
								}
							}// END of: if let main for humidity
							
							if let weatherDescription = dict["weather"] as? [Dictionary <String, AnyObject>] where weatherDescription.count > 0 {
								if let description = weatherDescription[0]["main"] as? String {
									dispatch_async(dispatch_get_main_queue(), {
										self.mainDescriptionLabel.text = "\(description.capitalizedString)"
									})
									print(description)
								}// END main title check
								
								if let description = weatherDescription[0]["description"] as? String {
									dispatch_async(dispatch_get_main_queue(), {
										self.fullDescriptionLabel.text = "\(description.capitalizedString)"
									})
									print(description)
								}// END full title check
								
								//Icon
								
							} // END of: if let weather for descriptioon
							
							if let wind = dict["wind"] as? Dictionary <String, AnyObject> {
								if let speed = wind["speed"] as? Double {
									dispatch_async(dispatch_get_main_queue(), {
										self.windSpeed.text = "\(speed) mph"
									})
									print(speed)
								} // END OF IF LET SPEED
								
//								if let direction = wind["deg"] as? Double {
//									
//									switch (direction) {
//									
//									case 348.75...360:
//									self.windDir?.wind = self.N
//									
//									case 0..<11.25:
//									self.windDir?.wind = self.N
//										
//									case 11.25..<33.75:
//									self.windDir?.wind = self.NNE
//									
//									case 33.75..<56.25:
//									self.windDir?.wind = self.NE
//									
//									case 56.25..<78.75:
//									self.windDir?.wind = self.ENE
//									
//									case 78.75..<101.25:
//									self.windDir?.wind = self.E
//									
//									case 101.25..<123.75:
//									self.windDir?.wind = self.ESE
//									
//									case 123.75..<146.25:
//									self.windDir?.wind = self.SE
//									
//									case 146.25..<168.75:
//									self.windDir?.wind = self.SSE
//									
//									case 168.75..<191.25:
//									self.windDir?.wind = self.S
//									
//									case 191.25..<213.75:
//									self.windDir?.wind = self.SSW
//									
//									case 213.75..<236.25:
//									self.windDir?.wind = self.SW
//									
//									case 236.25..<258.75:
//									self.windDir?.wind = self.WSW
//									
//									case 258.75..<281.25:
//									self.windDir?.wind = self.W
//									
//									case 281.25..<303.75:
//									self.windDir?.wind = self.WNW
//									
//									case 303.75..<326.25:
//									self.windDir?.wind = self.NW
//									
//									case 326.25..<348.75:
//									self.windDir?.wind = self.NNW
//								
//									default:
//									self.windDir?.wind = self.N
//								
//									}
//									
//								} // End of if let direction
								
							}// END Of if let wind
							
							if let sysDetl = dict["sys"] as? Dictionary <String, AnyObject> {
								if let sunrise = sysDetl["sunrise"] as? Double {
									let date = NSDate(timeIntervalSince1970: sunrise)
									let timeFormatter = NSDateFormatter()
									timeFormatter.dateFormat = "h:mma"
									dispatch_async(dispatch_get_main_queue(), {
										self.sunriseTimeLabel.text = timeFormatter.stringFromDate(date)
									})
								}
								
								if let sunset = sysDetl["sunset"] as? Double {
									let date = NSDate(timeIntervalSince1970: sunset)
									let timeFormatter = NSDateFormatter()
									timeFormatter.dateFormat = "h:mma"
									dispatch_async(dispatch_get_main_queue(), {
										self.sunsetTimeLabel.text = timeFormatter.stringFromDate(date)
									})
									
								}
							}
							
							
							if let date = dict["dt"] as? Double {
								let date = NSDate(timeIntervalSince1970: date)
								let dayFormatter = NSDateFormatter()
								let dateFormatter = NSDateFormatter()
								let timeFormatter = NSDateFormatter()
								dayFormatter.dateFormat = "EEEE"
								timeFormatter.dateStyle = .LongStyle
								dateFormatter.dateStyle = .LongStyle
								timeFormatter.dateFormat = "h:mm s"
								var timeLabel = dayFormatter.stringFromDate(date)
								var dayLabel = dateFormatter.stringFromDate(date)
								//self.dayLabel = timeFormatter.stringFromDate(date)
								
								dispatch_async(dispatch_get_main_queue(), {
									self.dateLabel.text = "\(timeLabel) \(dayLabel)"
								})
							}
							
							
							
							
							
							
							
							
							
							
						}// ENDDDD::::::: STOP
						
						print(json)
					} catch let err as NSError {
						print(err)
					}
				}
				}.resume()
		}
	}

}

