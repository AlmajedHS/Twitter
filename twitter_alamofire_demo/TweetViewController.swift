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
    var tweet: Tweet!
    
    
    
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
        
       
    }
    @IBAction func favoriteButton(_ sender: Any) {
        
        
        
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
