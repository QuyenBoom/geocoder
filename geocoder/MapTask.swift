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
    
    func geocodeAddress(address: String!) {
        var geocodeURLString = baseURLGeocode + "address=" + address
        geocodeURLString = geocodeURLString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        let geocodeURL = NSURL(string: geocodeURLString)!
        let session = NSURLSession.sharedSession()
        
        session.dataTaskWithURL(geocodeURL){(data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseData = data {
             
                do {
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    self.lookupAddressResults = json as! Dictionary<NSObject, AnyObject>
                    self.results = self.lookupAddressResults["results"]![0] as! Dictionary<NSObject, AnyObject>
                    self.fetchedFormattedAddress = self.results["formatted_address"] as! String
                    
                    var location = self.results["geometry"]!["location"] as! Dictionary<NSObject, AnyObject>
                    
                    self.fetchedAddressLatitude = location["lat"] as! Double
                    self.fetchedAddressLongitude = location["lng"] as! Double
                    
                    print(self.fetchedAddressLongitude)
                } catch {
                print("Could not get data")
                }
            }
        }.resume()
    }
}
