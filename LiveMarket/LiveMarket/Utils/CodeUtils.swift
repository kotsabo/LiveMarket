//
//  CodeUtils.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import Foundation

class CodeUtils {
    
    
    static func calculations(number_buy: Double?, number_sell: Double?, pipMultiplier: Int) -> (String,String,String,String,String,String,String) {
        
        let new_number_1 = number_buy! * Double(pipMultiplier)
        let new_number_2 = number_sell! * Double(pipMultiplier)
        
        _ = self.getPip(number_buy)
        _ = self.getPip(number_sell)
        
        let fractionalPip_1 = self.getFractionalPip(new_number_1)
        let fractionalPip_2 = self.getFractionalPip(new_number_2)
        
        let spread = (number_buy! - number_sell!) * Double(pipMultiplier)
        let spreadString = String(format: "%.2f", spread)
        
        var finalNumber_1: String?
        var finalNumber_2: String?
        
        finalNumber_1 = self.getIntPart(number_buy) + "."
        finalNumber_2 = self.getIntPart(number_sell) + "."
        
        let counter_1 = finalNumber_1!.characters.count
        let counter_2 = finalNumber_2!.characters.count

        if counter_1 < 4 {
            finalNumber_1 = finalNumber_1! + self.getDecimalPart(number_buy).substringToIndex(self.getDecimalPart(number_buy).startIndex.advancedBy(4-counter_1))
        }
        if counter_2 < 4 {
            finalNumber_2 = finalNumber_2! + self.getDecimalPart(number_sell).substringToIndex(self.getDecimalPart(number_sell).startIndex.advancedBy(4-counter_2))
        }
        
        let highlight_1 = self.getIntPart(new_number_1).substringFromIndex(self.getIntPart(new_number_1).endIndex.advancedBy(-2))
        let highlight_2 = self.getIntPart(new_number_2).substringFromIndex(self.getIntPart(new_number_2).endIndex.advancedBy(-2))

        return (finalNumber_1!,finalNumber_2!,fractionalPip_1,fractionalPip_2,spreadString,highlight_1,highlight_2)
    }
    
    static func getFractionalPip(number: Double?) -> String {
        
        let decimalPart = self.getDecimalPart(number)
        let fractionalPip = decimalPart.substringToIndex(decimalPart.startIndex.advancedBy(1))
        
        return fractionalPip
    }
    
    static func getPip(number: Double?) -> Character {
        
        let intPart = self.getIntPart(number!)
        
        return intPart.characters.last!
    }
    
    static func getIntPart(number: Double?) -> String {

        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        formatter.roundingMode = .RoundDown
        
        let finalNumberToString = formatter.stringFromNumber(number!)

        let intPart = finalNumberToString!.componentsSeparatedByString(".").last!

        return intPart
    }
    
    static func getDecimalPart(number: Double?) -> String {

        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.maximumFractionDigits = 7
        formatter.minimumFractionDigits = 7
        formatter.roundingMode = .RoundDown
        
        let finalNumberToString = formatter.stringFromNumber(number!)
        
        let decimalPart = finalNumberToString!.componentsSeparatedByString(".").last!
        
        return decimalPart
    }




}
