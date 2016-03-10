//
//  RoundedLabel.swift
//  geocoder
//
//  Created by Stephanie Kirtiadi on 3/10/16.
//  Copyright © 2016 Cmdrtorefresh. All rights reserved.
//

import UIKit

class RoundedLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        round_label()
    }
    
    func round_label() {
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
    }

}
