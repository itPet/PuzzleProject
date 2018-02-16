//
//  TableViewCellMain.swift
//  PuzzleProject
//
//  Created by Peter Karlsson on 2018-02-16.
//  Copyright © 2018 Peter Karlsson. All rights reserved.
//

import UIKit

class TableViewCellMain: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
