//
//  MyTableView.swift
//  Sri
//
//  Created by Suraj B on 7/6/17.
//  Copyright © 2017 Macbook. All rights reserved.
//

import UIKit

class MyTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["Depression","Worry","Money Problems","Marriage Disharmony"]
    
    var image = [UIImage (named: "ikon0"),UIImage (named: "ikon1"),UIImage (named: "ikon2"),UIImage (named: "ikon3")]
    
    var url : String=" "

    @IBOutlet var tableviewcounsel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableviewcounsel.delegate = self
        self.tableviewcounsel.dataSource = self
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "counselcell", for: indexPath) as! CounsellVcCell
        
        
        cell.labelname.text = list[indexPath.row]
        cell.imageview.image = image[indexPath.row]
            
            return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
//        let row = indexPath.row
//        
//        if row == 0 {
        
            url="http://www.sribagavath.org/contact/"
            
            self.performSegue(withIdentifier: "counsell", sender: self)
            
//            }
//
//        else if row == 1 {
//            url="http://www.sribagavath.org/contact/"
//            
//            self.performSegue(withIdentifier: "counsell", sender: self)
//            
//        }
//        else if row == 2 {
//            url="http://www.sribagavath.org/contact/"
//            
//            self.performSegue(withIdentifier: "counsell", sender: self)
//            
//        }
//        else if row == 3 {
//            url="http://www.sribagavath.org/contact/"
//            
//            self.performSegue(withIdentifier: "counsell", sender: self)
//            
//                 }
//             }
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "counsell" {
            
            let vc = segue.destination as! webViewController
            vc.urlpath = url
            
        }
        
        
        
    }
    
        
}






