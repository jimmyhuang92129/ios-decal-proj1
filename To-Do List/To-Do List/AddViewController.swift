//
//  AddViewController.swift
//  To-Do List
//
//  Created by Jimmy Huang on 10/18/16.
//  Copyright © 2016 Jimmy Huang. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {


    @IBOutlet strong var titleTextField: UITextField! = UITextField()
    @IBOutlet strong var notesTextView: UITextView! = UITextView()
    
    @IBAction func doneButtonPressed(_ sender: AnyObject) {
        
        print (titleTextField.text!)
        print (notesTextView.text!)
        
        var title:String! = titleTextField.text
        var desciption:String! = notesTextView.text
        
        // Initialize UserDefaults Storage Mechanism
        var userDefaults:UserDefaults = UserDefaults.standard
        // Create Mutable Array called itemList from the data alreadey present in userDefaults
        var itemList:NSMutableArray? = userDefaults.object(forKey: "itemList") as? NSMutableArray
        
        // Create Dictionary with 2 entries for itemTitle and itemNote
        //        var dataSet:NSMutableDictionary = NSMutableDictionary()
        //        dataSet.setObject(titleTextField.text, forKey: "itemTitle" as NSDictionary)
        //        dataSet.setObject(notesTextView.text, forKey: "itemNote" as NSDictionary)

       
        // Data already available in ToDo List
        if ((itemList) != nil){
            
            // Create an entirely new Mutable Array
            var newMutableList:NSMutableArray = NSMutableArray();
            
            // Trasfer items already present into new Mutable Array
            for obj in itemList!{
                newMutableList.add(obj as! NSDictionary)
            }
        
            // Delete old Mutable Array titled "itemList"
            userDefaults.removeObject(forKey: "itemList")
            
            var dataSet: [String:String] = [
                "itemTitle" : title,
                "itemNote": description
            ]
            
            // Add New Item Information into new Mutable Array
            newMutableList.add(dataSet)
            
            // Set userDefaults Strage Mechanism as new Mutable Array titled "itemList"
            userDefaults.set(newMutableList, forKey: "itemList")
            
        // First ToDo Item on List
        }else{
            userDefaults.removeObject(forKey: "itemList")
            itemList = NSMutableArray()
           
            var dataSet: [String:String] = [
                "itemTitle" : title,
                "itemNote": description
            ]
        
            itemList!.add(dataSet)
            userDefaults.set(itemList, forKey: "itemList")
        }
        
        //UserDefaults Magic
        userDefaults.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
