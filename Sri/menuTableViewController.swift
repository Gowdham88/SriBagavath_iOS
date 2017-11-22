//
//  sri.swift
//  Sri
//
//  Created by Macbook on 15/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class menuTableViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var list: UITableView!
    
    var titlearray = ["Agam Puram","Naan Yaar","Confirmation","Gnana Viduthalai ebook","Understanding"]
    var imagearray = ["flowericon0","flowericon1","flowericon2"]
    
    
    var url : String=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:Mymenu = self.list.dequeueReusableCell(withIdentifier: "menulist", for: indexPath) as! Mymenu
        
        
        cell.setCell(titlearray[indexPath.row])
        
        
        // Configure the cell...
        
        //cell.textLabel?.text = "Hello"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        if row == 0{
            
            url="https://www.youtube.com/channel/UCEkikBK-fwmmxJWoACfELug"
            self.performSegue(withIdentifier: "webclick", sender: self)
            
            
        }
        else if row == 1{
            url="http://www.sribagavath.org/audio-gallery/"
            self.performSegue(withIdentifier: "playerview", sender: self)
            
            
        }
        else if row == 2{
            url="http://www.sribagavath.org/magazine/"
            self.performSegue(withIdentifier: "webclick", sender: self)
            
            
        }
        else if row == 3{
            url="http://www.sribagavath.org/magazine/"
            self.performSegue(withIdentifier: "webclick", sender: self)
        }
        else if row == 4{
            url="http://www.sribagavath.org/magazine/"
            self.performSegue(withIdentifier: "webclick", sender: self)
        }
            
        
        
        
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
    
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "webclick"){
            
            let vc  = segue.destination as! webViewController
            vc.urlpath = url
            
            
            
            
        }
        else if(segue.identifier == "cz"
            ){
            
            let vc  = segue.destination as! czwebViewController
            vc.urlpath = url
            
        }
        
    }
    
    
}
