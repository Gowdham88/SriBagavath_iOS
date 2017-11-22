//
//  sri.swift
//  Sri
//
//  Created by Macbook on 15/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class sri: UITableViewController,SwiftAlertViewDelegate {
    
    
    @IBOutlet var myTableview: UITableView!
    
    var titlearray = ["Your Flowering","Videos","Gallery","Free E-Books","Programme","Question & Answer","Ask Ayya","Buy a Book","Buy a Subscription","Social Media","Contact","Counselling","Powered by"]
    
    
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 13
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:MyCell = self.myTableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        
        
       cell.setCell(titlearray[indexPath.row], iconImage: "icon\(indexPath.row)")
            

        // Configure the cell...
        
        //cell.textLabel?.text = "Hello"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        
        if row == 0 {
            
            
            self.performSegue(withIdentifier: "flower", sender: self)
        }
        
        else if row == 1{
            
            url="https://www.youtube.com/channel/UCEkikBK-fwmmxJWoACfELug"
            self.performSegue(withIdentifier: "webclick", sender: self)

            
        }
        else if row == 2{
            
            self.performSegue(withIdentifier: "gal", sender: self)

           
        }
      
       
        else if row == 3{
           
            self.performSegue(withIdentifier: "book", sender: self)

            
        }
        else if row == 4{
            url="http://www.sribagavath.org/events/"
            self.performSegue(withIdentifier: "webclick", sender: self)

           
        }
            else if row == 5{
        
            url="https://drive.google.com/folderview?id=0B2B_0GnmD9Mia2E1YjNWdDhWSTg"
            self.performSegue(withIdentifier: "webclick", sender: self)
    
        }
        
            
        else if row == 6{
            url="http://www.sribagavath.org/contact/"
            
            self.performSegue(withIdentifier: "webclick", sender: self)
        }
        else if row == 7{
            url="http://www.sribagavath.org/store/"
            self.performSegue(withIdentifier: "webclick", sender: self)
            
        }
            
        else if row == 8 {
            
            url="http://sribagavath.us6.list-manage.com/subscribe/post?u=cf5d11c8a31d4d5cb407913cf&id=253ea3bfe4"
            self.performSegue(withIdentifier: "webclick", sender: self)
            
        }
            
        else if row == 9 {
            
            let alertView = SwiftAlertView(nibName: "CustomAlertView", delegate: self, cancelButtonTitle: "Cancel" , otherButtonTitles: "Ok")
            alertView.backgroundColor = UIColor ( red: 0.9852, green: 0.9827, blue: 0.92, alpha: 1.0 )
            
            alertView.show()
            
         
            
        }
            
            
        else if row == 10 {
            
            url=""
            self.performSegue(withIdentifier: "centre", sender: self)
            
        }
            
            
        else if row == 11 {
            url=""
            self.performSegue(withIdentifier: "counsell", sender: self)
            
            
        }
        
        else if row == 12 {
            
            url="http://www.czsm.co.in"
            self.performSegue(withIdentifier: "cz", sender: self)
            

        }
        
        
    }
    
    
    
    func alertView(_ alertView: SwiftAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        print("Button Clicked At Index \(buttonIndex)")
        
        if(buttonIndex == 1){
            
            url = Social_url
            self.performSegue(withIdentifier: "webclick", sender: self)
            
        }
        
    }
    
    func didPresentAlertView(_ alertView: SwiftAlertView) {
        
        print("Did Present Alert View\n")
        
    }
    
    func didDismissAlertView(_ alertView: SwiftAlertView) {
        
        print("Did Dismiss Alert View\n")
        
        
        
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
