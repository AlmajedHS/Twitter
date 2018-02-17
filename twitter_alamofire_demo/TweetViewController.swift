//
//  TweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by Hussain Almajed on 2/15/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    var photoI: UIImage!
     var tweetPassed = ""
    var datePassed = ""
    var numberRetweets = ""
    var numberFavorites = ""
    var userNamepassed = ""
    var userprofilePassed = ""
    var retweetedBool = false
    var favoritedBool = false
    var tweetI: Tweet!
    
    
    
    @IBOutlet weak var profileImageD: UIImageView!
    @IBOutlet weak var usernamelabelD: UILabel!
    @IBOutlet weak var userprofilelabelD: UILabel!
    @IBOutlet weak var tweetlabelD: UILabel!
    @IBOutlet weak var datelabelD: UILabel!
    @IBOutlet weak var nretweetslabelD: UILabel!
    @IBOutlet weak var nfavoritelabelD: UILabel!
    @IBOutlet weak var retPic: UIButton!
    @IBOutlet weak var favPic: UIButton!
    
    @IBAction func replyButton(_ sender: UIButton) {
        
    }
    
    @IBAction func retweetButton(_ sender: UIButton) {
        if tweetI.retweeted {
            let image = UIImage(named: "retweet-icon.png") as UIImage?
            retPic.setBackgroundImage(image, for: .normal)
            tweetI.retweeted = false
            tweetI.retweetCount -= 1
            APIManager.shared.unretweet(tweetI) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unretweeting the following Tweet: \n\(tweet.text)")
                }
            }
            
        }else{
            let image = UIImage(named: "retweet-icon-green.png") as UIImage?
            retPic.setBackgroundImage(image, for: .normal)
            
            tweetI.retweeted = true
            tweetI.retweetCount += 1
            APIManager.shared.retweet(tweetI) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeting the following Tweet: \n\(tweet.text)")
                }
            }
            
            
            
        }
       
        
       
    }
    @IBAction func favoriteButton(_ sender: Any) {
        if tweetI.favorited! {
            let image = UIImage(named: "favor-icon.png") as UIImage?
            favPic.setBackgroundImage(image, for: .normal)
            tweetI.favorited = false
            tweetI.favoriteCount =  tweetI.favoriteCount - 1
            APIManager.shared.unfavorite(tweetI) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
            }
            
        }else{
            let image = UIImage(named: "favor-icon-red.png") as UIImage?
            favPic.setBackgroundImage(image, for: .normal)
            
            tweetI.favorited = true
            tweetI.favoriteCount =  tweetI.favoriteCount + 1
            APIManager.shared.favorite(tweetI) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
            
            
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageD.image = photoI
        usernamelabelD.text = userNamepassed
        userprofilelabelD.text = userprofilePassed
        tweetlabelD.text = tweetPassed
        datelabelD.text = datePassed
        nretweetslabelD.text = numberRetweets
        nfavoritelabelD.text = numberFavorites
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! TweetViewController
        vc.tweetI = tweetI
        vc.photoI = photoI
        vc.tweetPassed = tweetPassed
        vc.datePassed = datePassed
        vc.numberRetweets = numberRetweets
        vc.numberFavorites = numberFavorites
        vc.userNamepassed = userNamepassed
        vc.userprofilePassed = userprofilePassed
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
