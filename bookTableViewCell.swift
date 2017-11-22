//
//  bookTableViewCell.swift
//  Sri
//
//  Created by Gowdhaman on 22/07/16.
//  Copyright © 2016 Macbook. All rights reserved.
//

import UIKit

class bookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookdoc: UIImageView!
    @IBOutlet weak var bookdocname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
