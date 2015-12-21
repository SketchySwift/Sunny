//
//  wifiCheck.swift
//  Sunny
//
//  Created by Abdurrahman on 12/20/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit

public class Reachability {

	class func isConnectedToNetwork() -> Bool {
	
		var zeroAddress = sockaddr_in()
		zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
		zeroAddress.sin_family = sa_family_t(AF_INET)
		let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
			SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
		}
		var flags = SCNetworkReachabilityFlags()
		if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
			return false
		}
		let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
		let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
		return (isReachable && !needsConnection)
	}
	
}