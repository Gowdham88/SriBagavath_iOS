//
//  songTableVC.swift
//  DMK Songs
//
//  Created by Mac on 2/20/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit
import AVFoundation

var songnameArray = [String]()
var AudionameArray = [String]()
var removedsongnameArray = [String]()
//let urlString = "http://www.sribagavath.org/audio-gallery/"




class songTableVC: UITableViewController {

   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet var songsTableview: UITableView!
    
    var  urlString : String = "";
    

    override func viewDidLoad() {
        super.viewDidLoad()

        addAudioname()

      
    }





    func addAudioname() {
        
        startactivityanimation()

        songnameArray = []


        let url = URL(string: urlString)


        let task = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            
            print("data: \(data)")

            let urlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)

            print("urlcontent: \(urlContent as! String)")
            
            //var newstring = "urlcontent:" + urlContent
            
            

            if urlContent!.contains("<a href=") {
                
                

                var contentArray = urlContent!.components(separatedBy: "<a href=\"")

                
                for i in 0 ..< contentArray.count {

                    do {
                        var newContentArray = contentArray[i].components(separatedBy: "\">")
                        
                        
                        let songName = newContentArray[0]
    
                       
                        if songName.contains(".mp3") {
                            
                            songnameArray.append(songName)
                            
                            let audioName = newContentArray[1].components(separatedBy: "</a>");

                            AudionameArray.append(audioName[0]);
                            

                        } else {
                            
                            print("No audio in this")


                        }
                    }

                    catch {


                        print("Error")

                    }
                }
                print("songnameArray :\(songnameArray)")


                DispatchQueue.main.async {

                    self.removedSongsnameArrayfunction()

                    self.songsTableview.reloadData()

                }

            } else {

                print("Not Available")

            }



        }) 

        task.resume()




    }
    func removedSongsnameArrayfunction() {


        for i in 0 ..< songnameArray.count {



            let newsongname = songnameArray[i].replacingOccurrences(of: ".mp3", with: "")
            if newsongname.contains("%20") {

                let newsongnameone = newsongname.replacingOccurrences(of: "%20", with: " ")

                removedsongnameArray.append(newsongnameone)

            } else {
                removedsongnameArray.append(newsongname)


            }

            //print("removedsongnameArray: \(removedsongnameArray)")

        }
        
        DispatchQueue.main.async {

            self.songsTableview.reloadData()

        }



    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    func startactivityanimation() {
        activityIndicator.alpha = 1
        activityIndicator.startAnimating()
    }

    func stopactivityanimation() {
        activityIndicator.alpha = 0
        activityIndicator.stopAnimating()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songnameArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {



        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! CustomTableViewCell

        

        let removedsongname = AudionameArray[indexPath.row]
        cell.setCell(removedsongname, imageName: "sbg")

        // Configure the cell...
        stopactivityanimation()


        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        songcount = indexPath.row

        print("Didselectrowatindexpath \(songcount)")
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

}

