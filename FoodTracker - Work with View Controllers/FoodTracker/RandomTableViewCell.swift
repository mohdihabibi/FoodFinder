//
//  RandomTableViewCell.swift
//  FoodTracker
//
//  Created by Mohdi Habibi on 7/21/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit

class RandomTableViewCell: UITableViewCell {

    @IBOutlet weak var randomImage: UIImageView!
    @IBOutlet weak var randomName: UILabel!
    @IBOutlet weak var randomChef: UILabel!
    @IBOutlet weak var randomRating: RatingControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
