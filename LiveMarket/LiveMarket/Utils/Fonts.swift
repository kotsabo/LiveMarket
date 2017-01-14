//
//  Fonts.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import Foundation
import UIKit

struct Fonts {

    //System
    static var System_18: UIFont {
        get{
            return self.nameStringToUIFont("System-Regular", size: 18)
        }
        
    }
    
    static var System_22: UIFont {
        get{
            return self.nameStringToUIFont("System-Regular", size: 22)
        }
        
    }
    
    static var System_28: UIFont {
        get{
            return self.nameStringToUIFont("System-Regular", size: 28)
        }
        
    }
    
    static func nameStringToUIFont (name: String, size: CGFloat) -> UIFont {
        
        if name.containsString("System") {
            return UIFont.systemFontOfSize(size)
        }
        else {
            return UIFont(name: name, size: size)!
        }
        
    }

}