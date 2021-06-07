//
//  HorseTableViewCell.swift
//  SmartPhoneGameprogrammingTermProject
//
//  Created by  kpugame on 2021/06/08.
//

import UIKit

class HorseTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var horse: Horse!{
        didSet{
            nameLabel.text = horse.name
            ratingImageView.image = imageForRating(rating: horse.rating)
        }
    }
    
    func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
