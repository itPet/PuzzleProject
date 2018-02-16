//
//  TableViewCellResult.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-02-14.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import UIKit

class TableViewCellResult: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
