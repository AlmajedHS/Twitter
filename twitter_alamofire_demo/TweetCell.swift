//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var createdatLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            userLabel.text = tweet.user.name
            screennameLabel.text = "@"+tweet.user.screenName!
            createdatLabel.text = tweet.user.createdat
            profileImage.af_setImage(withURL: tweet.user.posterUrl!)
        }
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
