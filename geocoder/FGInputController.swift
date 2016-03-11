//
//  FGInputController.swift
//  geocoder
//
//  Created by Stephanie Kirtiadi on 3/10/16.
//  Copyright © 2016 Cmdrtorefresh. All rights reserved.
//

import UIKit

class FGInputController: UIViewController {

    @IBOutlet weak var inputAddress: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let ResultVC = segue.destinationViewController as? FGResultController{
        ResultVC.rawAddress = inputAddress.text
        }
    }

}
