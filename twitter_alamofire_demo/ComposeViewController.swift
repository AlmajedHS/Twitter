//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Hussain Almajed on 2/17/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


protocol ComposeViewControllerDelegate : class {
    func did(post: Tweet)
}


class ComposeViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var profileImage: UIImageView!
   // var tweetI: Tweet!
    @IBOutlet weak var profilenameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var charCountLabel: UILabel!
    @IBOutlet weak var textFieldText: UITextView!
    
    var userNamepassed = ""
    var userprofilePassed = ""
     var photoI: UIImage!
    
    weak var delegate: ComposeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        charCountLabel.text = "140"
        
        APIManager.shared.getCurrentAccount(completion: { (user, error) in
            if let error = error {
               
            } else if let user = user {
                print("Welcome \(user.name)")

                self.usernameLabel.text = user.name
                self.profilenameLabel.text = "@"+user.screenName!
                self.profileImage.af_setImage(withURL: user.posterUrl!)
                // MARK: TODO: set User.current, so that it's persisted
                
              
            }
        })
        
        
        
      
        
        
//        self.textFieldText = RSKPlaceholderTextView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 100))
//        self.textFieldText.placeholder = "What do you want to say about this event?"
//        
//        self.view.addSubview(self.textFieldText)

        // Do any additional setup after loading the view.
        textFieldText.delegate = self
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
       charCountLabel.text = String(characterLimit - newText.characters.count)
        
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        APIManager.shared.composeTweet(with: textFieldText.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                 APIManager.shared.post()
            }
        }
      
        
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        APIManager.shared.cancelButton()
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
