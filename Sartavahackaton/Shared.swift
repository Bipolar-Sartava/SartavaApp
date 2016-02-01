//
//  Shared.swift
//  Tourism
//
//  Created by Amit Zoaretzs on 29.1.2016.
//  Copyright © 2016 Amit Zoaretzs. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class Shared: NSObject {

    
    static func downloadAllAttractions() {
        let attractions : Attractions = Attractions()
        Alamofire.request(.GET, "\(BASE_URL)\(attractionsHeb)")
            .responseString { response in
                let responseString = response.result.value
                if let dataFromString = responseString!.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
                    let json : JSON = JSON(data: dataFromString)
                    let attractionsArray = json["result","records"].array
                    
                    for var i = 0; i < attractionsArray!.count ; i++ {
                        let dict = attractionsArray![i].dictionary

                        let newAttraction = Attraction(nattributeTypeId: dict!["_id"]!.stringValue, ncustomValue: (dict!["CustomValue"]?.stringValue)!, ndisplayOrder: (dict!["DisplayOrder"]?.intValue)!, nfullDescription: (dict!["FullDescription"]?.stringValue)!, nname: (dict!["name"]?.stringValue)!, nproductId: (dict!["ProductId"]?.stringValue)!, nshortdescription: (dict!["Shortdescription"]?.stringValue)!, nspecificationAttributeName:(dict!["SpecificationAttributeName"]?.stringValue)!, nspecificationAttributeOptionName: (dict!["SpecificationAttributeName"]?.stringValue)!)
                        attractions.addAttraction(newAttraction)
                    }
                    
                    for var i = 0; i<attractions.attractions.count; i++ {
                        print(attractions.attractions[i].name)
                    }
                    print(attractions.attractions.count)
                }
        }

    }
    
    
}
