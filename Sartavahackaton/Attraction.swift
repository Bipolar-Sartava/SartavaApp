//
//  Attraction.swift
//  
//
//  Created by Amit Zoaretzs on 29.1.2016.
//
//

import UIKit

class Attraction: NSObject {

    var attributeTypeId : String
    var customValue : NSMutableArray
    var displayOrder : Int
    var fullDescription : String
    var name : String
    var productId : String
    var shortdescription : String
    var specificationAttributeName : NSMutableArray
    var specificationAttributeOptionName : NSMutableArray
    var sharedNames = [String]()
    
     init(nattributeTypeId : String, ncustomValue : String , ndisplayOrder : Int , nfullDescription : String, nname : String, nproductId : String, nshortdescription : String, nspecificationAttributeName : String, nspecificationAttributeOptionName : String){

        self.attributeTypeId = nattributeTypeId
        self.customValue = NSMutableArray(object: ncustomValue)
        self.displayOrder = ndisplayOrder
        self.fullDescription = nfullDescription
        self.name = nname
        self.productId = nproductId
        self.shortdescription = nshortdescription
        self.specificationAttributeName = NSMutableArray(object: nspecificationAttributeName)
        self.specificationAttributeOptionName = NSMutableArray(object: nspecificationAttributeOptionName)
        
    }
    
}
