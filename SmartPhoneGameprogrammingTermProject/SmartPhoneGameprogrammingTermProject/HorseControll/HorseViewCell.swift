//
//  HorseViewCell.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by kpugame on 2021/05/23.
//

import UIKit

class HorseViewCell: UITableViewCell {
    @IBOutlet weak var horseImage: UIImageView!
    @IBOutlet weak var horseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
