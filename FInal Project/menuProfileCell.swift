//
//  menuProfileCell.swift
//  NavigationBar(4)
//
//  Created by Student on 2017-04-06.
//  Copyright © 2017 Geraldine Mendoza. All rights reserved.
//

import UIKit

class menuProfileCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
        //setting defaults
        profileName?.textColor = UIColor.white
        backgroundColor = UIColor(red: 41/255.0, green: 171/255, blue: 230/255, alpha: 1.0)
        
        //profileImage?.frame = CGRect(x: 126, y: 14, width: 114, height: 144)
        //profileImage?.image = UIImage(named: "AvatarHolder")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}
