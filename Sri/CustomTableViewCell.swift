//
//  CustomTableViewCell.swift
//  DMK Songs
//
//  Created by Mac on 2/20/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!

    @IBOutlet weak var myLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    func setCell(_ songText: String, imageName: String) {


        myLabel.text = songText
        myImage.image = UIImage(named: imageName)


    }


}
