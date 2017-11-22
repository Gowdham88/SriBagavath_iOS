//
//  galcell.swift
//  Sri
//
//  Created by Gowdhaman on 27/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class galcell: UITableViewCell {

    @IBOutlet var gallabel: UILabel!
    
    
    @IBOutlet var galimage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setCell(_ titleLabel: String, iconImage: String) {
        
        gallabel.text = titleLabel
        galimage.image = UIImage(named: iconImage)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
