//
//  galleries.swift
//  Sri
//
//  Created by Gowdhaman on 27/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class galleries: UITableViewController {

    @IBOutlet var newcell: UITableView!
    
    var titlearray = ["Audios Tamil","Audio English","Ayya Message"]
    var imagearray = ["sub1","sub1","sub2"]
    var url : String = ""
    
    
    
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
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : galcell = self.newcell.dequeueReusableCell(withIdentifier: "gallery", for: indexPath) as! galcell
        
        
        cell.setCell(titlearray[indexPath.row], iconImage: imagearray[indexPath.row])
        
        
        // Configure the cell...
        
        //cell.textLabel?.text = "Hello"
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    let row = indexPath.row
    
    if row == 0 {
        
        url = "http://www.sribagavath.org/audio-gallery/"
        self.performSegue(withIdentifier: "galwebview", sender: self)
        
     } else if row == 1 {
            
            url = "http://www.sribagavath.org/audio-english/"
            self.performSegue(withIdentifier: "galwebview", sender: self)
            
    } else if row == 2 {
        url = "http://www.sribagavath.org/magazine/"
        self.performSegue(withIdentifier: "galwebview", sender: self)
        
        
    }

    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if(segue.identifier == "galwebview"){
        
            let vc  = segue.destination as! webViewController
            vc.urlpath = url
            
        } else if (segue.identifier == "playerview"){
            
            let vc  = segue.destination as! songTableVC
            vc.urlString = url
            
        }
       

    }
        
        
        
    
}



