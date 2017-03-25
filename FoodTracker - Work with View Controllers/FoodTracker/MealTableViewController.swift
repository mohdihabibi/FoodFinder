//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Mohdi Habibi on 7/13/16.

//

import UIKit
var choice:Int = 0

class MealTableViewController: UITableViewController {
    
    //MARK: Properties

    
    var meals = [Meal]()


    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.rightBarButtonItem = editButtonItem()
            view.backgroundColor = UIColor.blue
        
        switch (choice){
        case 1:
            loadMainDish()
            navigationItem.title = "Main Dish"
        case 2:
            loadSalad()
            navigationItem.title = "Soup and Salad"
        case 3:
            loadAppetizers()
            navigationItem.title = "Appetizers"
        case 4:
            loadDesert()
            navigationItem.title = "Desert"
        default: return
        }
        
    }
    
    func loadSalad(){
        if let savedMeals = loadSalads() {
            meals += savedMeals
        }
            
        else{
            let photo = UIImage(named: "salad")
            let meal3 = Meal(name: "Salata", photo: photo, chef: "Mehdi")!
            
            meals += [meal3]
        }
    }
    func loadAppetizers(){
        if let savedMeals = loadApp() {
            meals += savedMeals
        }
            
        else{
            let photo = UIImage(named: "app")
            let meal3 = Meal(name: "Fries", photo: photo, chef: "Fereshta")!
            
            meals += [meal3]
        }
    }
    func loadDesert(){
        if let savedMeals = loadDes() {
            meals += savedMeals
        }
            
        else{
            let photo3 = UIImage(named: "des")
            let meal3 = Meal(name: "Cheese Cake", photo: photo3, chef: "Cheesecake Factory")!
            
            meals += [meal3]
        }
    }
    func loadMainDish(){
        if let savedMeals = loadMeals() {
            meals += savedMeals
        }
            
        else{
            let photo3 = UIImage(named: "meal3")
            let meal3 = Meal(name: "Pasta with meatballs", photo: photo3, chef: "Sample")!
            
            meals += [meal3]
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MealTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MealTableViewCell
        
        let meal = meals[indexPath.row]

        cell.nameLabel.text = meal.name
        cell.chefLabel.text = meal.chef
        cell.photoImageView.image = meal.photo
        //cell.ratingControl.rating = meal.rating

        return cell
    }
    
    @IBAction func unwindtoMealList(_ sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal{
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            
            else{
                let newIndexPath = IndexPath(row: meals.count, section: 0)
                meals.append(meal)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
            switch (choice){
            case 1: saveMeals()
            case 2: saveSalads()
            case 3: saveApp()
            case 4: saveDes()
            default: return
            }
        }
    }
    

    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            meals.remove(at: indexPath.row)
            switch (choice){
            case 1: saveMeals()
            case 2: saveSalads()
            case 3: saveApp()
            case 4: saveDes()
            default: return
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let mealDetailViewController = segue.destination as! MealViewController
            if let selectedMealCell = sender as? MealTableViewCell{
                let indexPath = tableView.indexPath(for: selectedMealCell)!
                let selectedMeal = meals[indexPath.row]
                mealDetailViewController.meal = selectedMeal
                selectedMeal.prepareForInterfaceBuilder()
            }
            
        }
            
        else if segue.identifier == "AddItem"{
            
        }
    }
    
    
    
    
    //MARK: NSCoding
    
    func saveMeals(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path!)
        if !isSuccessfulSave{
            print ("Failed to save meals...")
        }
    }
    
    func loadMeals()-> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path!) as? [Meal]
    }
    
    func saveSalads(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURLSalad.path!)
        if !isSuccessfulSave{
            print ("Failed to save meals...")
        }
    }
    
    func loadSalads()-> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURLSalad.path!) as? [Meal]
    }
    
    func saveApp(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURLApp.path!)
        if !isSuccessfulSave{
            print ("Failed to save meals...")
        }
    }
    
    func loadApp()-> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURLApp.path!) as? [Meal]
    }
    
    func saveDes(){
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURLDes.path!)
        if !isSuccessfulSave{
            print ("Failed to save meals...")
        }
    }
    
    func loadDes()-> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURLDes.path!) as? [Meal]
    }

}
