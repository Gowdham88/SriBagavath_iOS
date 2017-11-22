//
//  splashViewController.swift
//  Sri
//
//  Created by Gowdhaman on 20/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit
import AVFoundation

class splashViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    @IBOutlet var splash: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do
        {
        let audioPath = Bundle.main.path(forResource: "birds013", ofType: "mp3")
        try player = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: audioPath!) as URL)
        player.play()
         }
        catch
        {
            //Error
        }

        
        perform(#selector(splashViewController.showNavController), with: nil, afterDelay: 2)
        
        }
    
        func showNavController()
        {
        performSegue(withIdentifier: "splash", sender: self)

        }
    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
