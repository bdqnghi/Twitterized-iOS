//
//  Tweet.swift
//  Twitterized-iOS
//
//  Created by Nghi Bui on 11/28/15.
//  Copyright © 2015 nghibui. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var user: User
    var text: String
    var createdAt: NSDate
    var numberOfRetweets: Int
    var numberOfFavorites: Int
    
    init(dictionary: NSDictionary) {
        self.user = User(dictionary: dictionary["user"] as! NSDictionary)
        self.text = dictionary["text"] as! String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        self.createdAt = formatter.dateFromString(dictionary["created_at"] as! String)!
        
        self.numberOfRetweets = dictionary["retweet_count"] as! Int
        self.numberOfFavorites = dictionary["favorite_count"] as! Int
    }
    
    class func statusesWithArray(array: [NSDictionary]) -> [Tweet] {
        var statuses = [Tweet]()
        for dictionary in array {
            statuses.append(Tweet(dictionary: dictionary))
        }
        return statuses
    }
}
