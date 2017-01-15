//
//  LiveMarketTests.swift
//  LiveMarketTests
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import XCTest
@testable import LiveMarket

class LiveMarketTests: XCTestCase {
    
    var vc: MarketViewController!
    var exampleData: [RatesDAO] = [RatesDAO]()
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Market", bundle: NSBundle.mainBundle())
        self.vc = storyboard.instantiateInitialViewController() as! MarketViewController
        self.buildExampleData()
        self.vc.ratesArray = self.exampleData
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    private func buildExampleData() {
        
        self.exampleData.append(self.buildObject(1.345678, 1.345792, 10000, "EUR/USD", 53))
        self.exampleData.append(self.buildObject(24.234987, 23.487432, 100, "USD/MXN", 42))
        
    }
    
    private func buildObject(buy: Double?, _ sell: Double?, _ pipMultiplier: Int?, _ name: String?, _ currencyId: Int?) -> RatesDAO {
        
        let  rateObject: RatesDAO = RatesDAO()
        
        rateObject.buy = buy
        rateObject.sell = sell
        rateObject.currencyId = currencyId
        rateObject.name = name
        rateObject.pipMultiplier = pipMultiplier
        
        return rateObject
    }
    
    func testData() {
        let result = self.vc.data(1)
        
        XCTAssert(result.0 == "24.2")
        XCTAssert(result.1 == "23.4")
        XCTAssert(result.2 == "4")
        XCTAssert(result.3 == "7")
        XCTAssert(result.4 == "74.75")
        XCTAssert(result.5 == "23")
        XCTAssert(result.6 == "48")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            self.vc.data(1)
        }
    }
    
    
}
