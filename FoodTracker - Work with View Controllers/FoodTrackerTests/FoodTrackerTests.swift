//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Jane Appleseed on 5/23/15.
//  Copyright © 2015 Apple Inc. All rights reserved.
//

import XCTest

class FoodTrackerTests: XCTestCase {
    
    //MARK: FoodTracker Tests
    
    func testMealInitialization (){
        
        let potentialItem = Meal(name: "new Meal", photo: nil, chef: 4)
        XCTAssertNotNil(potentialItem)
        
        let noName = Meal(name: "", photo: nil, chef: 0)
        XCTAssertNil(noName, "Empty name is invalide")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, chef: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
        
    }

}
