//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Mohdi Habibi on 7/13/16.



import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chefLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        photoImageView.layer.cornerRadius = photoImageView.bounds.height / 2
        photoImageView.clipsToBounds = true
    }

}
