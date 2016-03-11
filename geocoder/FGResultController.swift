//
//  FGResultController.swift
//  geocoder
//
//  Created by Stephanie Kirtiadi on 3/10/16.
//  Copyright © 2016 Cmdrtorefresh. All rights reserved.
//

import UIKit

class FGResultController: UIViewController {
    
    @IBOutlet weak var displayAddress: UILabel!
    
    @IBOutlet weak var displayLat: UILabel!
    
    @IBOutlet weak var displayLon: UILabel!
    
    
    var rawAddress: String!
    
    var mapTask = MapTask()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.mapTask.geocodeAddress(rawAddress, withCompletionHandler: { (status, success) -> Void in
            if (success) {
                self.displayAddress.text = self.mapTask.fetchedFormattedAddress
                self.displayLat.text = String(self.mapTask.fetchedAddressLatitude)
                self.displayLon.text = String(self.mapTask.fetchedAddressLongitude)
            }
        })
        
//        print("FGResultController: " + mapTask.fetchedFormattedAddress)
        

        
    }



}
