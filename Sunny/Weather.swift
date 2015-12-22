//
//  Weather.swift
//  Sunny
//
//  Created by Abdurrahman on 12/19/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import Foundation
import UIKit

class Weather {
	
	//var wind: windDirections!
	
	var _windDirect: windDirections
	
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
	
	var windDirectionGet: windDirections {
		get {
			return _windDirect
		}
	}
	
	init (windDirect: windDirections) {
		self._windDirect = windDirect
	}
	
	enum windDirections {
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
		
		let urlString = "http://api.openweathermap.org/data/2.5/weather?id=4787117,uk&appid=2de143494c0b295cca9337e1e96b00e0"
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
										self._windDirect = windDirections.N
									case 0..<11.25:
										self._windDirect = windDirections.N
									case 11.25..<33.75:
										self._windDirect = windDirections.NNE
									case 33.75..<56.25:
										self._windDirect = windDirections.NE
									case 56.25..<78.75:
										self._windDirect = windDirections.ENE
									case 78.75..<101.25:
										self._windDirect = windDirections.E
									case 101.25..<123.75:
										self._windDirect = windDirections.ESE
									case 123.75..<146.25:
										self._windDirect = windDirections.SE
									case 146.25..<168.75:
										self._windDirect = windDirections.SSE
									case 168.75..<191.25:
										self._windDirect = windDirections.S
									case 191.25..<213.75:
										self._windDirect = windDirections.SSW
									case 213.75..<236.25:
										self._windDirect = windDirections.SW
									case 236.25..<258.75:
										self._windDirect = windDirections.WSW
									case 258.75..<281.25:
										self._windDirect = windDirections.W
									case 281.25..<303.75:
										self._windDirect = windDirections.WNW
									case 303.75..<326.25:
										self._windDirect = windDirections.NW
									case 326.25..<348.75:
										self._windDirect = windDirections.NNW
									default:
										self._windDirect = windDirections.N
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
/*

switch (direction) {
case 348.75...360:
self.windDir._windDirection = self.windDir._windDirection

case 0..<11.25:
self.windDir._windDirection = self.windDir.windDirectionStates.N

case 11.25..<33.75:
self.windDir._windDirection = self.windDir.windDirectionStates.NNE

case 33.75..<56.25:
self.windDir._windDirection = self.windDir.WindDirectionStates.NE

case 56.25..<78.75:
self.windDir._windDirection = self.windDir.WindDirectionStates.ENE

case 78.75..<101.25:
self.windDir._windDirection = self.windDir.WindDirectionStates.E

case 101.25..<123.75:
self.windDir._windDirection = self.windDir.WindDirectionStates.ESE

case 123.75..<146.25:
self.windDir._windDirection = self.windDir.WindDirectionStates.SE

case 146.25..<168.75:
self.windDir._windDirection = self.windDir.WindDirectionStates.SSE

case 168.75..<191.25:
self.windDir._windDirection = self.windDir.WindDirectionStates.S

case 191.25..<213.75:
self.windDir._windDirection = self.windDir.WindDirectionStates.SSW

case 213.75..<236.25:
self.windDir._windDirection = self.windDir.WindDirectionStates.SW

case 236.25..<258.75:
self.windDir._windDirection = self.windDir.WindDirectionStates.WSW

case 258.75..<281.25:
self.windDir._windDirection = self.windDir.WindDirectionStates.W

case 281.25..<303.75:
self.windDir._windDirection = self.windDir.WindDirectionStates.WNW

case 303.75..<326.25:
self.windDir._windDirection = self.windDir.WindDirectionStates.NW

case 326.25..<348.75:
self.windDir._windDirection = self.windDir.WindDirectionStates.NNW

default:
self.windDir._windDirection = self.windDir.WindDirectionStates.N

}
*/