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
    
    var rawAddress: String!
    
    var mapTask = MapTask()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        mapTask.geocodeAddress(rawAddress)
        displayAddress.text = mapTask.fetchedFormattedAddress
        
    }



}
