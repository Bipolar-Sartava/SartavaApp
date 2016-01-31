//
//  Attractions.swift
//  
//
//  Created by Amit Zoaretzs on 31.1.2016.
//
//

import UIKit

class Attractions: NSObject {

    
    var attractions : NSMutableArray
    
    override init() {
        self.attractions = NSMutableArray()
    }
    
    func addAttraction (newAttraction : Attraction) {
        var found : Bool = false
        for var i=0;i<self.attractions.count;i++ {
            let currentAttraction : Attraction = self.attractions.objectAtIndex(i) as! Attraction
            if currentAttraction.productId == newAttraction.productId {
                currentAttraction.customValue.addObject(newAttraction.customValue)
                currentAttraction.specificationAttributeName.addObject(newAttraction.specificationAttributeName)
                currentAttraction.specificationAttributeOptionName.addObject(newAttraction.specificationAttributeOptionName)
                self.attractions.replaceObjectAtIndex(i, withObject: currentAttraction)
                found = true
                print(currentAttraction.productId)
                break
            }
        }
        if !found {
            self.attractions.addObject(newAttraction)
        }
    }
}
