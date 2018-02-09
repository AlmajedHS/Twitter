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
    @IBOutlet weak var nreplyLabel: UILabel!
    @IBOutlet weak var nfavoriteLabel: UILabel!
    
    @IBOutlet weak var retPic: UIButton!
    @IBOutlet weak var nretweetLabel: UILabel!
    @IBAction func retwetButton(_ sender: UIButton) {
       
        if tweet.retweeted {
            let image = UIImage(named: "retweet-icon.png") as UIImage?
            retPic.setBackgroundImage(image, for: .normal)
            tweet.retweeted = false
            tweet.retweetCount -= 1
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unretweeting the following Tweet: \n\(tweet.text)")
                }
            }
            
        }else{
            let image = UIImage(named: "retweet-icon-green.png") as UIImage?
            retPic.setBackgroundImage(image, for: .normal)
            
            tweet.retweeted = true
            tweet.retweetCount += 1
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeting the following Tweet: \n\(tweet.text)")
                }
            }
            
            
            
        }
    }
    
    @IBOutlet weak var favPic: UIButton!
    @IBAction func favoriteButton(_ sender: UIButton) {
        
        if tweet.favorited! {
           let image = UIImage(named: "favor-icon.png") as UIImage?
           favPic.setBackgroundImage(image, for: .normal)
            tweet.favorited = false
            tweet.favoriteCount =  tweet.favoriteCount - 1
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
            }

        }else{
            let image = UIImage(named: "favor-icon-red.png") as UIImage?
            favPic.setBackgroundImage(image, for: .normal)
            
            tweet.favorited = true
            tweet.favoriteCount =  tweet.favoriteCount + 1
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }

        
        
        }
      
       
        
    }
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            userLabel.text = tweet.user.name
            screennameLabel.text = "@"+tweet.user.screenName!
            createdatLabel.text = tweet.user.createdat
            profileImage.af_setImage(withURL: tweet.user.posterUrl!)
            nretweetLabel.text = String(tweet.retweetCount)
            nfavoriteLabel.text = String(tweet.favoriteCount)
            
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
