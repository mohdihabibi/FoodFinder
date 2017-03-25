//
//  MainViewController.swift
//  FoodTracker
//
//  Created by Mohdi Habibi on 7/19/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit



class MainViewController: UIViewController, UIApplicationDelegate {

    @IBAction func mainDishButton(_ sender: AnyObject) {
        choice = 1
    }
    
    @IBAction func soupButton(_ sender: AnyObject) {
        choice = 2
    }
    
    @IBAction func appetizerButton(_ sender: AnyObject) {
        choice = 3
    }
    
    @IBAction func desertButton(_ sender: AnyObject) {
        choice = 4
    }
    

    @IBOutlet weak var mainDishButton: UIButton!
    @IBOutlet weak var soupButton: UIButton!
    @IBOutlet weak var appetizerButton: UIButton!
    @IBOutlet weak var desertButton: UIButton!
    @IBOutlet weak var randomButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDish" {
            if let dest = segue.destinationViewController as? MealTableViewController {
                dest.title = "Meals"
                dest.choice = 1
            }
        }
        else if segue.identifier == "showSalad" {
            if let dest = segue.destinationViewController as? MealTableViewController {
                dest.title = "Salad and Soup"
                dest.choice = 2
            }
        }
        else if segue.identifier == "showApp" {
            if let dest = segue.destinationViewController as? MealTableViewController {
                dest.title = "Appetizer"
                dest.choice = 3
            }
        }
        else if segue.identifier == "showDesert" {
            if let dest = segue.destinationViewController as? MealTableViewController {
                dest.title = "Desert"
                dest.choice = 4
            }
        }
    }


}
