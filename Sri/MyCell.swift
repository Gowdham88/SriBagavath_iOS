//
//  MyCell.swift
//  Sri
//
//  Created by Macbook on 15/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet var myImage: UIImageView!
    
    
    @IBOutlet var myLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    func setCell(_ titleLabel: String, iconImage: String) {
    
    myLabel.text = titleLabel
    myImage.image = UIImage(named: iconImage)
    
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
