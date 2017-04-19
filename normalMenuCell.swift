//
//  normalMenuCellTableViewCell.swift
//  NavigationBar(4)
//
//  Created by Student on 2017-04-16.
//  Copyright © 2017 Geraldine Mendoza. All rights reserved.
//

import UIKit

class normalMenuCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //label defaults
        label?.frame = CGRect(x: 108, y: 15, width: 197, height: 52)
        label?.textColor = UIColor.white
        
        backgroundColor = UIColor(red: 41/255.0, green: 171/255, blue: 230/255, alpha: 1.0)
        //the size of the icon should probably be relative compared to the device
        icon?.frame = CGRect(x: 33, y: 17, width: 44, height: 45)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
