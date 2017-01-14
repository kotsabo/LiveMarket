//
//  DarkButton.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import UIKit

class DarkButton: UIButton {
        
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        
        self.layer.cornerRadius = 2
        self.layer.borderWidth = 1
        self.layer.borderColor = Colors.LightGray.CGColor
        self.backgroundColor = Colors.DarkGray
        self.setTitleColor(Colors.White, forState: .Normal)
        
        self.addTarget(self, action: #selector(self.pressedInside), forControlEvents: [.TouchDown])
        self.addTarget(self, action: #selector(self.released), forControlEvents: [.TouchDragExit, .TouchUpInside, .TouchUpOutside, .TouchCancel])
        
        self.makeFontsForButton()
    }
    
    private func makeFontsForButton() {
        
        self.titleLabel!.font = Fonts.System_18
    }
    
    func pressedInside(sender: AnyObject) {
        
        self.layer.borderColor = Colors.LightGray.CGColor
        self.backgroundColor = Colors.LightGray
        self.setTitleColor(Colors.White, forState: .Highlighted)
    }
    
    func released(sender: AnyObject) {
        
        self.layer.borderColor = Colors.LightGray.CGColor
        self.backgroundColor = Colors.DarkGray
        self.setTitleColor(Colors.White, forState: .Normal)
    }


}
