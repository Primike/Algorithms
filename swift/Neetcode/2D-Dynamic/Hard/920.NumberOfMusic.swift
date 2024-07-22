// Your music player contains n different songs. 
// You want to listen to goal songs (not necessarily different) during your trip. 
// To avoid boredom, you will create a playlist so that:
// Every song is played at least once.
// A song can only be played again only if k other songs have been played.
// Given n, goal, and k, return the number of possible playlists that you can create. 

// Time: O(n * goal), Space: O(n * goal)
func numMusicPlaylists(_ n: Int, _ goal: Int, _ k: Int) -> Int {
    let mod = 1_000_000_007
    var memo = [String: Int]()

    func dp(_ capacity: Int, _ songs: Int) -> Int {
        let key = "\(capacity),\(songs)"

        if capacity == 0, songs == 0 { return 1 }
        if capacity == 0 || songs == 0 { return 0 }
        if let value = memo[key] { return value }
        
        var result = (dp(capacity - 1, songs - 1) * (n - songs + 1)) % mod
        if songs > k { result += (dp(capacity - 1, songs) * (songs - k)) % mod }
        
        result %= mod
        memo[key] = result
        return result
    }
    
    return dp(goal, n)
}

print(numMusicPlaylists(3, 3, 1))
print(numMusicPlaylists(2, 3, 0))
print(numMusicPlaylists(2, 3, 1))