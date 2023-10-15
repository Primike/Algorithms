// Optimize 
class Twitter {

    var following: [Int: Set<Int>]
    var tweets: [(Int, Int)] 

    init() {
        self.following = [:]
        self.tweets = []
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets.append((userId, tweetId))
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        var recentTweets = [Int]()
        var i = tweets.count - 1

        while recentTweets.count < 10, i >= 0 {
            let (id, tweetId) = tweets[i]

            if following[userId, default: []].contains(id) || id == userId {
                recentTweets.append(tweetId)
            }

            i -= 1
        }

        return recentTweets
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].remove(followeeId)
    }
}
