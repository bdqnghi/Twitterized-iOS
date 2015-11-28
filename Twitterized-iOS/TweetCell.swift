//
//  TweetCell.swift
//  Twitterized-iOS
//
//  Created by Nghi Bui on 11/28/15.
//  Copyright © 2015 nghibui. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var imagesView: UIImageView!
   
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.imagesView.layer.cornerRadius = 9.0
        self.imagesView.layer.masksToBounds = true
    }

    var tweet: Tweet? {
        willSet(newValue) {
            self.imagesView.setImageWithURL((newValue?.user.profileImageUrl)!)
            self.nameLabel.text = newValue?.user.name
            self.screenNameLabel.text = newValue?.user.screenName
            self.statusLabel.text = newValue?.text
            self.timeLabel.text = String(newValue?.createdAt.timeIntervalSinceNow)
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
