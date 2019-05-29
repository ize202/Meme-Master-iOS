//
//  DiscoverPageViewController.swift
//  Meme-Master
//
//  Created by Aize Igbinakenzua on 2019-05-28.
//  Copyright © 2019 Aize Igbinakenzua. All rights reserved.
//

import UIKit
import Memebox_TweetsUI

class DiscoverPageViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tweetVC = TweetsVC()
        if let tweets = getTweets() {
            tweetVC.setup(withTweets: tweets)
        } else {
            tweetVC.setup(withEmptyMessage: "Hello")
        }
        
        navigationController?.pushViewController(tweetVC, animated: false)
    }
}

//-----------------
// MARK: - Read JSON
//-----------------
extension DiscoverPageViewController {
    
    func getTweets() -> [Tweet]? {
        if let path = Bundle.main.path(forResource: "tweets", ofType: "json") {
            do {
                let tweetData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let tweets = try JSONDecoder().decode([Tweet].self, from: tweetData)
                return tweets
            } catch {
                // handle error
            }
        }
        return nil
    }
}

