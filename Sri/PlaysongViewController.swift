//
//  PlaysongViewController.swift
//  DMK Songs
//
//  Created by Mac on 2/25/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit
import AVFoundation

var songcount: Int = 0

class PlaysongViewController: UIViewController {


    var player : AVAudioPlayer!
    var audioFile: AVAudioFile!
    var inSearchMode = false
    var currentAudioPath:URL!
    var audioLength = 0.0
    var totalLengthOfAudio = ""
    var timer:Timer!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var progressTimerLabel: UILabel!
    @IBOutlet weak var totalLengthofAudioLabel: UILabel!
    @IBOutlet weak var playerProgressSlider: UISlider!
    @IBOutlet weak var previousButton: UIButton!

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        startactivityanimation()

        playerProgressSlider.value = 0

        playMusic()


    }

    func startactivityanimation() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
    }

    func stopactivityanimation() {
        
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        
    }



    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        
    }

    @IBAction func backbuttonPressed(_ sender: AnyObject) {
        
        DispatchQueue.main.async{

        self.stopAudioplayer()
        self.stopTimer()

        self.dismiss(animated: true, completion: nil)
            
        }
    }

    @IBAction func changeAudioLocationSlider(_ sender: UISlider) {
        
        if(player != nil) {

            player.currentTime = TimeInterval(sender.value)
            
        }

    }


    @IBAction func play(_ sender: AnyObject) {


        let play  = UIImage(named: "Play")
        let pause = UIImage(named: "Pause")

        //playMusic()
        
        if player != nil {
       
                if player.isPlaying {
                    
                    pauseAudioPlayer()
                    player.isPlaying ? "\(playButton.setImage( pause, for: UIControlState()))" : "\(playButton.setImage(play , for: UIControlState()))"
                    
        
                } else {
                    
                    self.player.play()
                    player.isPlaying ? "\(playButton.setImage( pause, for: UIControlState()))" : "\(playButton.setImage(pause , for: UIControlState()))"
                    
                }
            
        }
        
    }



    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool){

        print("func Audioplayerdidfinishplaying")
        if flag {
            songcount = songcount + 1
            if songcount > songnameArray.count-1 {
                songcount = songcount - 1
                return
            }
            playMusic()

        }
    }

    func stopAudioplayer() {

        if(player != nil) {
            
            player.stop();
            player = nil;
            
        }
        

    }

    func pauseAudioPlayer(){

        print("func pause")
        if(player != nil) {
            
            player.pause()
            
        }

    }

    func startTimer() {
        
        print("func start timer")
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(PlaysongViewController.update(_:)), userInfo: nil,repeats: true)
            timer.fire()
        }
        
    }

    func stopTimer(){
        
        if(timer != nil) {
        
        timer.invalidate()
            
        }

    }

    func updateLabels(){
        
        print("func updatelabels")
        updateSongNameLabel()

    }


    func updateSongNameLabel(){
        print("func updatesongnameLabel")
        //let songName = readSongNameFromPlist(currentAudioIndex)
        print("\(songcount)")

        let songName = removedsongnameArray[songcount]
        songNameLabel.text = songName
    }

    func showTotalSurahLength(){
        print("func showtotalsurahlength")
        calculateSurahLength()
        totalLengthofAudioLabel.text = totalLengthOfAudio
    }

    func calculateSurahLength() {

        print("func calculatesurahlength")
        //let hour_ = abs(Int(audioLength/3600))
        let minute_ = abs(Int((audioLength/60).truncatingRemainder(dividingBy: 60)))
        let second_ = abs(Int(audioLength.truncatingRemainder(dividingBy: 60)))

        //let hour = hour_ > 9 ? "\(hour_)" : "0\(hour_)"
        let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
        let second = second_ > 9 ? "\(second_)" : "0\(second_)"
        totalLengthOfAudio = "\(minute):\(second)"
    }

    func update(_ timer: Timer){
        
        print("func updatetimer")
        
        if(player != nil) {

        if !player.isPlaying {

            print("under if - player playing")
            //return
        } else {

            print("Else - player not playing")

        }

        //let hour_   = abs(Int(player.currentTime)/3600)
        let minute_ = abs(Int((player.currentTime/60).truncatingRemainder(dividingBy: 60)))
        let second_ = abs(Int(player.currentTime.truncatingRemainder(dividingBy: 60)))

        //let hour = hour_ > 9 ? "\(hour_)" : "0\(hour_)"
        let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
        let second = second_ > 9 ? "\(second_)" : "0\(second_)"

        progressTimerLabel.text  = "\(minute):\(second)"
        playerProgressSlider.value = CFloat(player.currentTime)
            
        }

    }

    override func viewDidDisappear(_ animated: Bool) {
        stopactivityanimation()
        stopAudioplayer()
    }

   
    func playMusic() {

        //print(songnameArray)


        print("songcount: \(songcount)")
        print("songnameArray: \(songnameArray.count)")
        
        let urlone = songnameArray[songcount]

        print(urlone)

        let urlonestring =  URL(string: urlone)


        URLSession.shared.downloadTask(with: urlonestring!, completionHandler: {
            (data, response, error) -> Void in
            DispatchQueue.main.async {
                
                print("Finished downloading")

                if let data = data {
                
                    do {
                        
                        self.player = try AVAudioPlayer(contentsOf: data)
                        self.audioLength = self.player.duration
                        self.playerProgressSlider.maximumValue = CFloat(self.player.duration)
                        self.playerProgressSlider.minimumValue = 0.0
                        self.playerProgressSlider.value = 0.0


                        self.player.prepareToPlay()

                        //self.activityIndicator.stopAnimating()
                        self.stopactivityanimation()
                        self.player.play()

                        self.showTotalSurahLength()
                        self.updateLabels()
                        self.progressTimerLabel.text = "00:00"
                        self.startTimer()
                        
                        self.player.isPlaying ? "\(self.playButton.setImage( UIImage(named: "Pause"), for: UIControlState()))" : "\(self.playButton.setImage(UIImage(named: "Pause") , for: UIControlState()))"


                    } catch let error as NSError {
                        
                        self.player = nil
                        print(error.localizedDescription)
                        
                    } catch {

                        print("catch error\(error)")
                    }
                    // there is data. do this
                } else if let error = error {
                    
//                    print("error.descrip: \(error.description)")
                    
                }
            }

        }).resume()

        print("Audio Present")

    }

    func playNext() {

        startactivityanimation()


        print("\(songcount)")
        if songcount < songnameArray.count - 1 {

        songcount = songcount + 1
            print("\(songcount)")

        playMusic()

        } else {

            print("Need to Disable playnext button")

        }

    }

    func playPrevious() {

        startactivityanimation()



        if songcount != 0 {

            print("\(songcount)")
        songcount = songcount - 1
            print("\(songcount)")

            playMusic()

        } else {


            print("Need to disable playprevious button")
        }

    }
    
    @IBAction func previous(_ sender: AnyObject) {

        playPrevious()

    }

    @IBAction func next(_ sender: AnyObject) {
        
        playNext()

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
