//
//  MarketViewController.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import UIKit
import SwiftEventBus

class MarketViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Properties
    
    @IBOutlet weak var navigationBarView: NavigationBar!
    @IBOutlet weak var marketTableView: UITableView!
    
    var ratesArray: [RatesDAO] = [RatesDAO]()
    var dictionaryRates: [Int : RatesDAO] = [ : ]
    
    //MARK: - View Controller Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customizeView()
        self.setupStrings()
        self.customizeTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        WebServiceInvocation.ratesService()
        self.getResponse()
        NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: #selector(self.makeCall), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        SwiftEventBus.unregister(self, name: "ratesServiceCompleted")
    }
    
    // MARK: - View customization
    
    private func customizeView() {
        
        self.view.backgroundColor = Colors.DarkGray
    }
    
    private func setupStrings() {
        
        self.navigationBarView.titleLabel.text = NSLocalizedString("market_title", comment: "")
    }
    
    private func customizeTable() {
        
        self.marketTableView.dataSource = self
        self.marketTableView.delegate = self
        self.marketTableView.separatorStyle = .None
        self.marketTableView.backgroundColor = Colors.DarkGray
    }
    
    //MARK: - Functionality Methods
    
    @objc private func makeCall() {
        
        WebServiceInvocation.ratesService()
    }
    
    @objc private func updateDataToDictionary() {
        
        for rate in self.ratesArray {
            self.dictionaryRates.updateValue(rate, forKey: rate.currencyId!)
        }
    }
    
    private func getResponse() {
        

        SwiftEventBus.onMainThread(self, name: "ratesServiceCompleted") { result in
            
            self.ratesArray = result.object as! [RatesDAO]
            
            self.marketTableView.reloadData()
            
            NSTimer.scheduledTimerWithTimeInterval(0.8, target: self, selector: #selector(self.updateDataToDictionary), userInfo: nil, repeats: true)
        }
    }
    
    private func data(index: Int) -> (String, String, String, String, String, String, String) {
        
        return CodeUtils.calculations(self.ratesArray[index].buy, number_sell: self.ratesArray[index].sell, pipMultiplier: self.ratesArray[index].pipMultiplier!)
    }
    
    //MARK: - Customize cell's buttons
    
    private func cusomizeButtons(cell: MarketTableViewCell, index: Int) {
        
        let currentRate = self.ratesArray[index]
        
        if let previousRate = self.dictionaryRates[currentRate.currencyId!] {
            
            if previousRate.sell > currentRate.sell {
                cell.sellButton.backgroundColor = Colors.Red
                cell.sellButton.layer.borderColor = Colors.Red.CGColor
            }
            else if previousRate.sell < currentRate.sell {
                cell.sellButton.backgroundColor = Colors.Green
                cell.sellButton.layer.borderColor = Colors.Green.CGColor
            }
            else {
                cell.sellButton.backgroundColor = Colors.LightGray
                cell.sellButton.layer.borderColor = Colors.LightGray.CGColor
            }
            
            if previousRate.buy > currentRate.buy {
                cell.buyButton.backgroundColor = Colors.Red
                cell.buyButton.layer.borderColor = Colors.Red.CGColor
            }
            else if previousRate.buy < currentRate.buy {
                cell.buyButton.backgroundColor = Colors.Green
                cell.buyButton.layer.borderColor = Colors.Green.CGColor
            }
            else {
                cell.buyButton.backgroundColor = Colors.LightGray
                cell.buyButton.layer.borderColor = Colors.LightGray.CGColor
            }
        }
    }
    
    //MARK: - Table Methods
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 140
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.ratesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("marketcell", forIndexPath: indexPath) as! MarketTableViewCell

        let dataSource = self.data(indexPath.row)
        
        self.cusomizeButtons(cell, index: indexPath.row)

        cell.sellValueLabel.text = dataSource.1
        cell.buyValueLabel.text = dataSource.0
        cell.sellFractionalPipLabel.text = dataSource.3
        cell.buyFractionalPipLabel.text = dataSource.2
        cell.spreadLabel.text = dataSource.4
        cell.sellHighlightValueLabel.text = dataSource.6
        cell.buyHighlightValueLabel.text = dataSource.5
        
        cell.nameLabel.text = self.ratesArray[indexPath.row].name
        
        return cell
    }
    
    

}
