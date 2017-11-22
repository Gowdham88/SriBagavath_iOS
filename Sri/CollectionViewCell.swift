//
//  CollectionViewCell.swift
//  DMK Songs
//
//  Created by Mac on 2/16/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImage: UIImageView!

    @IBOutlet weak var songName: UILabel!

    var dmksongsname: DMKSongs!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        layer.cornerRadius = 5.0

    }

    func configureCell(_ dmksongsname: DMKSongs) {
        
        print(dmksongsname)
        self.dmksongsname = dmksongsname

        songName.text = self.dmksongsname.name.capitalized
        myImage.image = UIImage(named: "\(self.dmksongsname.imageId)")

    }

    
}
