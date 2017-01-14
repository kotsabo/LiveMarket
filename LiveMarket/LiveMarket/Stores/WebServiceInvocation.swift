//
//  WebServiceInvocation.swift
//  LiveMarket
//
//  Created by Ilias Kotsampougioukoglou on 1/14/17.
//  Copyright © 2017 Mine. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
import SwiftEventBus

class WebServiceInvocation {
    
    //MARK: Rates
    
    static func ratesService() {
        
        let url = Config.baseURL + Config.ratesURL
        
        Alamofire.request(.POST, url, parameters: ["includeMultiplier":true] ,
            encoding: ParameterEncoding.JSON)
            .responseArray{ (response: Response<[RatesDAO], NSError>) in
                switch response.result {
                case .Success(let ratesDAO):
                    SwiftEventBus.post("ratesServiceCompleted", sender: ratesDAO)
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                }
                
        }
        
    }
}
