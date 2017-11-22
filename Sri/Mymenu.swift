//
//  Mymenu.swift
//  Sri
//
//  Created by Gowdhaman on 22/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class Mymenu: UITableViewCell {

    @IBOutlet weak var labelmenu : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func setCell(_ titleLabel: String) {
        
        labelmenu.text = titleLabel
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
