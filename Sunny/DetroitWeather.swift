//
//  DetroitWeather.swift
//  Sunny
//
//  Created by Abdurrahman on 12/21/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import Foundation
import UIKit

class DetroitWeather {
	
	//var wind: windDirections!
	
	var _windDirect: detroitWindDirections
	
	// ICON ---------------------
	var _icon: String!
	
	var icon: String {
		get {
			if _icon == nil {
				return ""
			}
			return _icon
		}
	}
	// END of ICON ---------------------
	
	var windDirectionGet: detroitWindDirections {
		get {
			return _windDirect
		}
	}
	
	init (windDirect: detroitWindDirections) {
		self._windDirect = windDirect
	}
	
	enum detroitWindDirections {
		case N
		case NNE
		case NE
		case ENE
		case E
		case ESE
		case SE
		case SSE
		case S
		case SSW
		case SW
		case WSW
		case W
		case WNW
		case NW
		case NNW
	}
	
	func updateTheWindDir() {
		
		let urlString = "http://api.openweathermap.org/data/2.5/weather?zip=48201,us&appid=2de143494c0b295cca9337e1e96b00e0"
		let session = NSURLSession.sharedSession()
		
		if let url = NSURL(string: urlString) {
			
			session.dataTaskWithURL(url) { (data, response, error) -> Void in
				
				if let responseData = data {
					
					do {
						let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
						
						if let dict = json as? Dictionary <String, AnyObject> {
							
							if let weatherDescription = dict["weather"] as? [Dictionary <String, AnyObject>] where weatherDescription.count > 0 {
								
								if let icon = weatherDescription[0]["icon"] as? String {
									self._icon = icon
								}
								
							}
							
							if let wind = dict["wind"] as? Dictionary <String, AnyObject> {
								if let direction = wind["deg"] as? Double {
									
									switch (direction) {
									case 348.75...360:
										self._windDirect = detroitWindDirections.N
									case 0..<11.25:
										self._windDirect = detroitWindDirections.N
									case 11.25..<33.75:
										self._windDirect = detroitWindDirections.NNE
									case 33.75..<56.25:
										self._windDirect = detroitWindDirections.NE
									case 56.25..<78.75:
										self._windDirect = detroitWindDirections.ENE
									case 78.75..<101.25:
										self._windDirect = detroitWindDirections.E
									case 101.25..<123.75:
										self._windDirect = detroitWindDirections.ESE
									case 123.75..<146.25:
										self._windDirect = detroitWindDirections.SE
									case 146.25..<168.75:
										self._windDirect = detroitWindDirections.SSE
									case 168.75..<191.25:
										self._windDirect = detroitWindDirections.S
									case 191.25..<213.75:
										self._windDirect = detroitWindDirections.SSW
									case 213.75..<236.25:
										self._windDirect = detroitWindDirections.SW
									case 236.25..<258.75:
										self._windDirect = detroitWindDirections.WSW
									case 258.75..<281.25:
										self._windDirect = detroitWindDirections.W
									case 281.25..<303.75:
										self._windDirect = detroitWindDirections.WNW
									case 303.75..<326.25:
										self._windDirect = detroitWindDirections.NW
									case 326.25..<348.75:
										self._windDirect = detroitWindDirections.NNW
									default:
										self._windDirect = detroitWindDirections.N
									}
									
									
								}
							}
							
						}
						
					} catch let err as NSError {
						print(err)
					}
					
				}
			}
			
		}
	}
	
}
