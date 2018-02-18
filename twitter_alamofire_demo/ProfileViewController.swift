//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Hussain Almajed on 2/17/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var profilenameLabel: UILabel!
    
    @IBOutlet weak var nTweets: UILabel!
    
    @IBOutlet weak var nFollowers: UILabel!
    
    @IBOutlet weak var nFollowing: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.getCurrentAccount(completion: { (user, error) in
            if let error = error {
                
            } else if let user = user {
                print("Welcome \(user.name)")
                
                self.usernameLabel.text = user.name
                self.profilenameLabel.text = "@"+user.screenName!
                self.profileImage.af_setImage(withURL: user.posterUrl!)
                self.nTweets.text = String(user.numTweets)
                self.nFollowers.text = String(user.numFollowers)
                //print(user.numFollowers)
                self.nFollowing.text = String(user.numFollowing)
               // self.headerImage.af_setImage(withURL: user.headerUrl!)
                
                // MARK: TODO: set User.current, so that it's persisted
                
                
            }
        })
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
