//
//  Twitters.swift
//  Twitter
//
//  Created by Alon Ribovsky on 02/10/2020.
//  Copyright © 2020 Alon Ribovsky. All rights reserved.
//

import SwiftUI

struct Twitters: View {
    
    @EnvironmentObject var tweetsData: TweetsData
    
    var body: some View {
        List {
            ForEach(tweetsData.tweets, id: \.self) { tweet in
                Text(tweet)
            }
        }
        .onAppear{
            self.tweetsData.fetchTweets()
        }
    }
}

struct Twitters_Previews: PreviewProvider {
    static var previews: some View {
        Twitters()
    }
}
