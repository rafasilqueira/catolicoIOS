//
//  PrayerByCategoryRow.swift
//  catolico
//
//  Created by Rafael Silqueira Tupinamba on 14/10/2018.
//  Copyright © 2018 Rafael Silqueira. All rights reserved.
//

import UIKit

class PrayerByCategoryRow: UITableViewCell {
    
    
    @IBOutlet weak var txtCategoria: UILabel!
    @IBOutlet weak var txtQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
