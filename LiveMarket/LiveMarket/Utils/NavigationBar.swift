//
//  NavigationBar.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import UIKit
import PureLayout

class NavigationBar: UIView {
    
    var backButton: UIButton!
    var rightButton: UIButton!
    var titleLabel: UILabel!
    var titleLeadingConstraint: NSLayoutConstraint!
    var contentView: UIView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.initBar()
    }
    
    required init() {
        super.init(frame: CGRectZero)
        self.initBar()
    }
    
    private func initBar() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView = UIView()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.backgroundColor = Colors.DarkGray
        self.addSubview(self.contentView)
        
        self.contentView.autoPinEdgeToSuperviewEdge(.Left, withInset: 0)
        self.contentView.autoPinEdgeToSuperviewEdge(.Right, withInset: 0)
        self.contentView.autoPinEdgeToSuperviewEdge(.Top, withInset: 0)
        self.contentView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 0)
        
        self.backButton = UIButton()
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        self.backButton.setImage(UIImage(named: "back"), forState: .Normal)
        self.backButton.addTarget(self, action: #selector(back), forControlEvents: .TouchUpInside)
        self.contentView.addSubview(self.backButton)
        
        self.backButton.autoPinEdgeToSuperviewEdge(.Left, withInset: 15 * UIView.horizontalAdaptationFactor())
        self.backButton.autoPinEdgeToSuperviewEdge(.Top, withInset: 40 * UIView.horizontalAdaptationFactor())
        self.backButton.autoSetDimension(.Width, toSize: 45 * UIView.horizontalAdaptationFactor())
        self.backButton.autoSetDimension(.Height, toSize: 45 * UIView.horizontalAdaptationFactor())

        self.rightButton = UIButton()
        self.rightButton.translatesAutoresizingMaskIntoConstraints = false
        self.rightButton.titleLabel?.textAlignment = .Right
        self.rightButton.titleLabel?.font = Fonts.System_22
        self.rightButton.setTitle("", forState: .Normal)
        self.contentView.addSubview(self.rightButton)
        
        self.rightButton.autoPinEdgeToSuperviewEdge(.Right, withInset: 15 * UIView.horizontalAdaptationFactor())
        self.rightButton.autoPinEdgeToSuperviewEdge(.Top, withInset: 40 * UIView.horizontalAdaptationFactor())
        self.rightButton.autoSetDimension(.Width, toSize: 45 * UIView.horizontalAdaptationFactor())
        self.rightButton.autoSetDimension(.Height, toSize: 45 * UIView.horizontalAdaptationFactor())
        
        self.titleLabel = UILabel()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textColor = UIColor.whiteColor()
        self.titleLabel.font = Fonts.System_22
        self.contentView.addSubview(self.titleLabel)
        
        self.titleLeadingConstraint = self.titleLabel.autoPinEdge(.Left, toEdge: .Right, ofView: self.backButton!, withOffset: 15 * UIView.horizontalAdaptationFactor())
        self.titleLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: 50 * UIView.horizontalAdaptationFactor())
        self.titleLabel.autoPinEdgeToSuperviewEdge(.Right, withInset: 70 * UIView.horizontalAdaptationFactor())

    }
    
    func back() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let nc = appDelegate.window?.rootViewController as! UINavigationController
        nc.popViewControllerAnimated(true)
    }


}

public extension UIView {
    
    static func horizontalAdaptationFactor() -> CGFloat {
        let ratio: CGFloat = UIScreen.mainScreen().bounds.size.width / 375.0
        return ratio
    }
    
    static func imageAdaptationFactor() -> CGFloat {
        
        let imageFactor = UIView.horizontalAdaptationFactor()
        return imageFactor
    }
    
    static func verticalAdaptationFactor() -> CGFloat {
        let ratio: CGFloat = UIScreen.mainScreen().bounds.size.height / 667.0
        return ratio
    }
    
}

