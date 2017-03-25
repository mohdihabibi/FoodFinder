//
//  RandomTableViewController.swift
//  FoodTracker
//
//  Created by Mohdi Habibi on 7/21/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class RandomTableViewController: UITableViewController {
    var randomList = [Meal]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        addMeal()
        addSalad()
        addApp()
        addDes()
        
    }

    
    func addMeal(){
        var list = [Meal]()
        if let meals = loadMeals(){
            list += meals
        }
        let index = UInt32(list.count)
        randomList += [list[randomNumber(index)]]
    }
    
    func addSalad(){
        var list = [Meal]()
        if let meals = loadSalads(){
            list += meals
        }
        let index = UInt32(list.count)
        randomList += [list[randomNumber(index)]]
    }
    
    func addApp(){
        var list = [Meal]()
        if let meals = loadApp(){
            list += meals
        }
        let index = UInt32(list.count)
        randomList += [list[randomNumber(index)]]
    }
    
    func addDes(){
        var list = [Meal]()
        if let meals = loadDes(){
            list += meals
        }
        let index = UInt32(list.count)
        randomList += [list[randomNumber(index)]]
    }
    
    func randomNumber (count:UInt32) -> Int {
        let randomIndex = Int(arc4random_uniform(count))
        return randomIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return randomList.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "RandomTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RandomTableViewCell

        let meal = randomList[indexPath.row]
        
        cell.randomName.text = meal.name
        cell.randomChef.text = meal.chef
        cell.randomImage.image = meal.photo
        cell.randomRating.rating = meal.rating

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: NSCoding
    
    
    func loadMeals()-> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [Meal]
    }
    
    
    func loadSalads()-> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURLSalad.path!) as? [Meal]
    }
    
    
    func loadApp()-> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURLApp.path!) as? [Meal]
    }
    
    
    func loadDes()-> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURLDes.path!) as? [Meal]
    }

}
