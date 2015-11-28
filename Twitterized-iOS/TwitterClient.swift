//
//  TwitterClient.swift
//  Twitterized-iOS
//
//  Created by Nghi Bui on 11/28/15.
//  Copyright © 2015 nghibui. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "z53PBjRexrymAfE4cXedQ"
let twitterConsumerSecret = "y9jTPAgZbdSTqI8kG9ho9wIocoav90std4XNIJn0jU"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1RequestOperationManager {

    var loginCompletion: ((user: User?, error: NSError?) -> ())?
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        
        return Static.instance
    }

    
    func loginWithCompletion(completion: (user: User?, error: NSError?) -> ()) {
        loginCompletion = completion
        
        // Fetch request token & redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "drmtwitterdemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("Got the request token")
            let authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL!)
            }) { (error: NSError!) -> Void in
                print("Error getting the request token: \(error)")
                self.loginCompletion?(user: nil, error: error)

        }
        
    }
    
    func homeTimelineWithParams(params: NSDictionary?, completion: (statuses: [Tweet]?, error: NSError?) -> ()) {
        self.GET("1.1/statuses/home_timeline.json", parameters: nil, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            let statuses = Tweet.statusesWithArray(response as! [NSDictionary])
            completion(statuses: statuses, error: nil)
            }, failure: { (operation: AFHTTPRequestOperation?, error: NSError?) -> Void in
                print("error getting home timeline")
                completion(statuses: nil, error: error)
        })
    }
    
}
