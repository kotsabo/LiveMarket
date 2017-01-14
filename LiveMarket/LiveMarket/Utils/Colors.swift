//
//  Colors.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    
    // Predefined colors will go here

    static var DarkGray: UIColor{
        get{
            return self.hexStringToUIColor("#2a2a2a")
        }
        
    }
    
    static var MediumGray: UIColor{
        get{
            return hexStringToUIColor("#696969")
        }
        
    }
    
    static var LightGray: UIColor{
        get{
            return hexStringToUIColor("#939393")
        }
        
    }
    
    static var VeryLightGray: UIColor{
        get{
            return hexStringToUIColor("#bdbdbd")
        }
        
    }
    
    static var MediumBlue: UIColor{
        get{
            return hexStringToUIColor("#4870A9")
        }
        
    }
    
    static var Red: UIColor{
        get{
            return hexStringToUIColor("#e50000")
        }
        
    }
    
    static var Green: UIColor{
        get{
            return hexStringToUIColor("#00e500")
        }
        
    }
    
    static var White: UIColor{
        get{
            return hexStringToUIColor("#FFFFFF")
        }
        
    }

    
    static func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
}

