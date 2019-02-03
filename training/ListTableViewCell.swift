//
//  ListTableViewCell.swift
//  training
//
//  Created by 土井萌 on 2018/12/27.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var DayLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    @IBOutlet var AlertLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
