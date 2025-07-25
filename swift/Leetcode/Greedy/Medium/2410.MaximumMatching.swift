// The ith player can match with the jth trainer 
// if the player's ability is less than or equal to the trainer's 
// training capacity. Additionally, the ith player can be matched 
// with at most one trainer, and the jth trainer can be matched 
// with at most one player.
// Return the maximum number of matchings between players and 
// trainers that satisfy these conditions.

// Time: O(n * log(n) + m * log(m)), Space: O(log(n) + log(m))
func matchPlayersAndTrainers(_ players: [Int], _ trainers: [Int]) -> Int {
    let players = players.sorted(), trainers = trainers.sorted()
    var result = 0
    var index = 0

    for i in 0..<trainers.count {
        if index < players.count, trainers[i] >= players[index] {
            index += 1
            result += 1
        }
    }

    return result
}

print(matchPlayersAndTrainers([4,7,9], [8,2,5,8]))
print(matchPlayersAndTrainers([1,1,1], [10]))