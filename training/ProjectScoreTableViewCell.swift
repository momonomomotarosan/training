//
//  ProjectScoreTableViewCell.swift
//  training
//
//  Created by 土井萌 on 2018/12/29.
//  Copyright © 2018年 土井萌. All rights reserved.
//

import UIKit

class ProjectScoreTableViewCell: UITableViewCell {
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var ScoreLabel: UILabel!
    @IBAction func Button() {
        
    }
    
    var indexPath = IndexPath()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
