//
//  RoundedImage.swift
//  geocoder
//
//  Created by Stephanie Kirtiadi on 3/10/16.
//  Copyright © 2016 Cmdrtorefresh. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        round_image()
    }
    
    func round_image() {
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
    }

}
