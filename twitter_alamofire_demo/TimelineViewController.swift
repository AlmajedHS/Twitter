//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ComposeViewControllerDelegate {
    func did(post: Tweet) {
        
    }
    
    
    var tweets: [Tweet] = []
    var refreshControl: UIRefreshControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        refreshControlAction()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
         self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(refreshControlAction), for:.valueChanged)
       self.tableView.addSubview(refreshControl)
        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 100
        
//        APIManager.shared.getHomeTimeLine { (tweets, error) in
//            if let tweets = tweets {
//                self.tweets = tweets
//                self.tableView.reloadData()
//            } else if let error = error {
//                print("Error getting home timeline: " + error.localizedDescription)
//            }
//        }
    }
    
    @objc func refreshControlAction() {
        
        APIManager.shared.getHomeTimeLine { (tweets, error) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            } else if let error = error {
                print("Error getting home timeline: " + error.localizedDescription)
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPost(_ sender: Any) {
       // APIManager.shared.postTimeLine()
    }
    
    @IBAction func didTapLogout(_ sender: Any) {
        APIManager.shared.logout()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            print("reach")
        let vc = segue.destination as! TweetViewController
        //let vc1 = segue.destination as! ComposeViewController
        
         vc.tweetI = (sender! as! TweetCell).tweet
        vc.photoI = (sender! as! TweetCell).profileImage.image
        vc.userNamepassed = (sender! as! TweetCell).userLabel.text!
         vc.userprofilePassed = (sender! as! TweetCell).screennameLabel.text!
         vc.datePassed = (sender! as! TweetCell).createdatLabel.text!
         vc.numberFavorites = (sender! as! TweetCell).nfavoriteLabel.text!
        vc.numberRetweets = (sender! as! TweetCell).nretweetLabel.text!
        vc.tweetPassed = (sender! as! TweetCell).tweet.text
        }
        
        else if segue.identifier == "postTweetSegue"{

            
        }
        
      //  vc1.delegate = self
    
        
        
        
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
