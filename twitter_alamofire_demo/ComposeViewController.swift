//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Hussain Almajed on 2/17/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit


protocol ComposeViewControllerDelegate : class {
    func did(post: Tweet)
}


class ComposeViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textFieldText: UITextView!
    
    weak var delegate: ComposeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.textFieldText = RSKPlaceholderTextView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 100))
//        self.textFieldText.placeholder = "What do you want to say about this event?"
//        
//        self.view.addSubview(self.textFieldText)

        // Do any additional setup after loading the view.
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
