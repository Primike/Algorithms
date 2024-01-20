// However, the basketball team is not allowed to have conflicts. 
// A conflict exists if a younger player has a strictly higher score than an 
// older player. A conflict does not occur between players of the same age.
// Given two lists, scores and ages, where each scores[i] and ages[i] 
// represents the score and age of the ith player, respectively, 
// return the highest overall score of all possible basketball teams.

// Time: O(n^2), Space: O(n)
func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
    var players = Array(zip(scores, ages))
    players.sort { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }
    var tab = Array(repeating: 0, count: players.count)

    for i in 0..<players.count {
        tab[i] = players[i].0

        for j in 0..<i {
            if players[i].0 >= players[j].0 {
                tab[i] = max(tab[i], tab[j] + players[i].0)
            }
        }
    }

    return tab.max() ?? 0
}  

print(bestTeamScore([1,3,5,10,15], [1,2,3,4,5]))
print(bestTeamScore([4,5,6,5], [2,1,2,1]))
print(bestTeamScore([1,2,3,5], [8,9,10,1]))


func bestTeamScore2(_ scores: [Int], _ ages: [Int]) -> Int {
    var players = Array(zip(scores, ages))
    players.sort { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }
    var memo = [String: Int]()

    func dp(_ i: Int, _ maximum: Int) -> Int {
        let key = "\(i),\(maximum)"

        if i == players.count { return 0 }
        if let value = memo[key] { return value }

        var result = dp(i + 1, maximum)

        if players[i].0 >= maximum {
            result = max(result, dp(i + 1, players[i].0) + players[i].0)
        }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}