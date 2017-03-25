//
//  Meal.swift
//  FoodTracker
//
//  Created by Mohdi Habibi on 7/13/16.
//

import UIKit

class Meal: NSObject, NSCoding{
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    //var rating: Int
    var chef: String?
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    static let ArchiveURLSalad = DocumentsDirectory.appendingPathComponent("salad")
    static let ArchiveURLApp = DocumentsDirectory.appendingPathComponent("appetizer")
    static let ArchiveURLDes = DocumentsDirectory.appendingPathComponent("desert")
    
    //MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
    //    static let ratingKey = "rating"
        static let chefKey = "chef"
        
    }
    
    init? (name: String, photo: UIImage?, chef: String?){
        self.name = name
        self.photo = photo
        //self.rating = rating
        self.chef = chef
        super.init()
        
        if name.isEmpty {
            return nil
        }
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(chef, forKey: PropertyKey.chefKey)
        aCoder.encode(photo, forKey: PropertyKey.photoKey)
        //aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)

    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        //let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        let chef = aDecoder.decodeObject(forKey: PropertyKey.chefKey) as? String

        
        self.init(name: name, photo: photo, chef: chef!)
    }
}
