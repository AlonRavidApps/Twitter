//
//  TweetsData.swift
//  Twitter
//
//  Created by Alon Ribovsky on 02/10/2020.
//  Copyright © 2020 Alon Ribovsky. All rights reserved.
//

import Combine
import SwiftUI

final class TweetsData: ObservableObject {
    @Published var tweets: [String] = []
    
    func fetchTweets() {
        
        guard let tweetsURl = URL(string: "https://api.twitter.com/1.1/search/tweets.json?q=%23superbowl&result_type=recent") else {
            return
        }
        
        var tweetsRequest = URLRequest(url: tweetsURl)
        tweetsRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: tweetsRequest) { (data, response, error) in
            
            guard error == nil, let outputData = data else { return }
            
            if let jsonData = try? JSONSerialization.jsonObject(with: outputData, options: []) as? [String: Any]{
                print(jsonData)
                if let tweet = jsonData.keys.first{
                    DispatchQueue.main.async {
                        self.tweets.append(tweet)
                    }
                }
            }
        }.resume()
    }
}
