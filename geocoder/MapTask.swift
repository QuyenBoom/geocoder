//
//  MapTask.swift
//  yumba
//
//  Created by Stephanie Kirtiadi on 3/9/16.
//  Copyright © 2016 Cmdrtorefresh. All rights reserved.
//

import UIKit

class MapTask: NSObject {
    
    let baseURLGeocode = "https://maps.googleapis.com/maps/api/geocode/json?"
    
    var lookupAddressResults: Dictionary<NSObject, AnyObject>!
    
    var results: Dictionary<NSObject, AnyObject>!
    
    var fetchedFormattedAddress: String!
    
    var fetchedAddressLongitude: Double!
    
    var fetchedAddressLatitude: Double!
    
    override init() {
        super.init()
    }
    
    
    func geocodeAddress(address: String!, withCompletionHandler completionHandler: ((status: String, success: Bool) -> Void)) {
        if let lookupAddress = address {
            var geocodeURLString = baseURLGeocode + "address=" + lookupAddress
            geocodeURLString = geocodeURLString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            
            let geocodeURL = NSURL(string: geocodeURLString)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let geocodingResultsData = NSData(contentsOfURL: geocodeURL!)
                
                do {
                    let dictionary: Dictionary<NSObject, AnyObject> = try NSJSONSerialization.JSONObjectWithData(geocodingResultsData!, options: NSJSONReadingOptions.MutableContainers) as! Dictionary<NSObject, AnyObject>
                    
                    // Get the response status.
                    let status = dictionary["status"] as! String
                    
                    if status == "OK" {
                        let allResults = dictionary["results"] as! Array<Dictionary<NSObject, AnyObject>>
                        self.lookupAddressResults = allResults[0]
                    }
                    
                    // Keep the most important values.
                    self.fetchedFormattedAddress = self.lookupAddressResults["formatted_address"] as! String
                    let geometry = self.lookupAddressResults["geometry"] as! Dictionary<NSObject, AnyObject>
                    
                    self.fetchedAddressLongitude = ((geometry["location"] as! Dictionary<NSObject, AnyObject>)["lng"] as! NSNumber).doubleValue
                    self.fetchedAddressLatitude = ((geometry["location"] as! Dictionary<NSObject, AnyObject>)["lat"] as! NSNumber).doubleValue
                    
                    completionHandler(status: status, success: true)
                    
                } catch {
                    print("something bad")
                }
                
            })
        }
    }
    
}
