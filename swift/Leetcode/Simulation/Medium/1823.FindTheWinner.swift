// Start at the 1st friend.
// Count the next k friends in the clockwise direction 
// including the friend you started at. 
// The counting wraps around the circle and may count some friends more than once.
// The last friend you counted leaves the circle and loses the game.
// If there is still more than one friend in the circle, 
// go back to step 2 starting from the friend 
// immediately clockwise of the friend who just lost and repeat.
// Else, the last friend in the circle wins the game.
// Given the number of friends, n, and an integer k, return the winner of the game.

// Time: O(n), Space: O(n)
func findTheWinner(_ n: Int, _ k: Int) -> Int {
    var players = Array(1...n)
    var current = 0
    
    while players.count > 1 {
        current = (current + k - 1) % players.count
        players.remove(at: current)
    }

    return players[0]
}

print(findTheWinner(5, 2))
print(findTheWinner(6, 5))