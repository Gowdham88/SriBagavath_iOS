//
//  ViewController.swift
//  DMK Songs
//
//  Created by Mac on 2/15/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit
import AVFoundation

class playerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var songnameArray = [String]()
    var removedsongnameArray = [String]()
    
    var player: AVAudioPlayer!
    var audioFile: AVAudioFile!
    
    
    var musicPlayer: AVAudioPlayer!
    var inSearchMode = false
    
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if songnameArray.count == 0 {
            
            
            
            return 9
            
            //collection.reloadData()
            
            
        } else {
            
            return songnameArray.count
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? CollectionViewCell {
            
            
            
            if removedsongnameArray.isEmpty{
                
                
                
                let dmksong = DMKSongs(name: "Loading", imageId: indexPath.row, songLink: "Yes")
                
                cell.configureCell(dmksong)
                
                return cell
                //collection.reloadData()
                
                
            } else {
                
                //collection.reloadData()
                
                
                let dmksong = DMKSongs(name: removedsongnameArray[indexPath.row], imageId: indexPath.row, songLink: "Yes")
                
                cell.configureCell(dmksong)
                
                
                return cell
                //collection.reloadData()
                
                
                
            }
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    // MARK: - uiCollectionView Datasource Methods
    
    func collectionView(_ collectionView: UICollectionView,   didSelectItemAt indexPath: IndexPath) {
        
        if songnameArray.isEmpty {
            
            
            
            print("Song array empty")
            
        } else {
            
            print("Music playing:")
            
            
            //playMusic(indexPath)
            
            
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

