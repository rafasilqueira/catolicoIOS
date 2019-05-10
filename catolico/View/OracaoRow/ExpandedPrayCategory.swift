//
//  ExpandedPrayCategory.swift
//  catolico
//
//  Created by Rafael Silqueira Tupinamba on 20/10/2018.
//  Copyright © 2018 Rafael Silqueira. All rights reserved.
//

import UIKit

class ExpandedPrayCategory: UITableViewCell {

    @IBOutlet weak var txtCategoria: UILabel!
    
    @IBOutlet weak var tableViewOracao: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
