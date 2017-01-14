//
//  CoverViewController.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import UIKit

class CoverViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var marketImageView: UIImageView!
    @IBOutlet weak var enterButton: DarkButton!
    
    //MARK: - ViewController Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customizeView()
        self.setupStrings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: - View Customization Methods
    
    private func customizeView() {
        
        self.view.backgroundColor = Colors.DarkGray
    }
    
    private func setupStrings() {
        
        self.enterButton.setTitle(NSLocalizedString("enter_entry", comment: ""), forState: .Normal)
    }
    
    //MARK: - IBAction Method
    
    @IBAction func enterButtonTapped(sender: AnyObject) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Market", bundle: nil)
        let marketViewController: MarketViewController = storyboard.instantiateViewControllerWithIdentifier("marketVC") as! MarketViewController
        
        self.navigationController?.pushViewController(marketViewController, animated: true)
    }
    

}
