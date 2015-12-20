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
	
	var wind: windDirections!
	
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
	
	/*

	switch (direction)
{
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

}