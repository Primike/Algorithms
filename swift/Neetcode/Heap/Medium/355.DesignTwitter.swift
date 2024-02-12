struct Tweet: Comparable {
    let time: Int
    let tweetId: Int

    static func <(_ l: Tweet, _ r: Tweet) -> Bool {
        return l.time < r.time
    }    
}

class Twitter {

    private var tweets: [Int: [Tweet]]
    private var following: [Int: Set<Int>]
    private var count: Int

    init() {
        self.tweets = [:]
        self.following = [:]
        self.count = 0
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweets[userId, default: []].append(Tweet(time: count, tweetId: tweetId))
        count += 1
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        var followees = following[userId, default: []] + [userId]
        var heap = Heap<Tweet>(.minHeap)

        for id in followees {
            var userTweets = tweets[id, default: []]
            var i = userTweets.count - 1

            while i >= 0 {
                if heap.count < 10 {
                    heap.push(userTweets[i])
                } else if let oldest = heap.peek(), oldest < userTweets[i] {
                    heap.pop()
                    heap.push(userTweets[i])
                } else {
                    i = 0
                }

                i -= 1
            }
        }

        var result = [Int]()

        while !heap.isEmpty {
            result.append(heap.pop()!.tweetId)
        }

        return result.reversed()
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        following[followerId, default: []].remove(followeeId)
    }
}