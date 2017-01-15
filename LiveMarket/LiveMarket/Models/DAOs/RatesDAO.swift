//
//  RatesDAO.swift
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class RatesDAO: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kRatesDAOBuyKey: String = "buy"
	internal let kRatesDAOSellKey: String = "sell"
	internal let kRatesDAOCurrencyIdKey: String = "currencyId"
	internal let kRatesDAOPipMultiplierKey: String = "pipMultiplier"
	internal let kRatesDAONameKey: String = "name"

    // MARK: Properties
	public var buy: Double?
	public var sell: Double?
	public var currencyId: Int?
	public var pipMultiplier: Int?
	public var name: String?
    
    init() {
        
    }

    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(_ map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		buy <- map[kRatesDAOBuyKey]
		sell <- map[kRatesDAOSellKey]
		currencyId <- map[kRatesDAOCurrencyIdKey]
		pipMultiplier <- map[kRatesDAOPipMultiplierKey]
		name <- map[kRatesDAONameKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if buy != nil {
			dictionary.updateValue(buy!, forKey: kRatesDAOBuyKey)
		}
		if sell != nil {
			dictionary.updateValue(sell!, forKey: kRatesDAOSellKey)
		}
		if currencyId != nil {
			dictionary.updateValue(currencyId!, forKey: kRatesDAOCurrencyIdKey)
		}
		if pipMultiplier != nil {
			dictionary.updateValue(pipMultiplier!, forKey: kRatesDAOPipMultiplierKey)
		}
		if name != nil {
			dictionary.updateValue(name!, forKey: kRatesDAONameKey)
		}

        return dictionary
    }

}
