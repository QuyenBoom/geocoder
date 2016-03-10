//
//  RoundedButton.swift
//  yumba
//
//  Created by Stephanie Kirtiadi on 3/9/16.
//  Copyright © 2016 Cmdrtorefresh. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        round_button()
    }
    
    func round_button() {
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        
    }
    
}
