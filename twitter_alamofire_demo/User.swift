//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var screenName: String?
    var createdat: String?
    var posterUrl: URL?
    var headerUrl: URL?
    var numFollowers: Int = 0
    var numFollowing: Int = 0
    var numTweets: Int = 0
    var posterPath: String?
    var headerPath: String?
    var dictionary: [String: Any]?
    
    
    
    
    
    init(dictionary: [String: Any]) {
        self.dictionary = dictionary
        
        name = dictionary["name"] as! String
        screenName = dictionary["screen_name"] as? String
        createdat = dictionary["created_at"] as? String
        
        posterPath = dictionary["profile_image_url_https"] as? String
        posterUrl = URL(string: posterPath!)
       // print("post: " + posterPath!)
        numFollowers = (dictionary["followers_count"] as? Int) ?? 0
         numFollowing = (dictionary["friends_count"] as? Int) ?? 0
         numTweets = (dictionary["statuses_count"] as? Int) ?? 0
        
//        headerPath = dictionary["profile_image_url_https"] as? String
//        headerUrl = URL(string: headerPath!)
        
    
        
        
    }
   private static var _current: User?

    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        
        }

    }
    
}
