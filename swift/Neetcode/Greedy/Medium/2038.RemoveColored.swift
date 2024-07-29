// Alice is only allowed to remove a piece colored 'A' 
// if both its neighbors are also colored 'A'. 
// She is not allowed to remove pieces that are colored 'B'.
// Bob is only allowed to remove a piece colored 'B' 
// if both its neighbors are also colored 'B'. 
// He is not allowed to remove pieces that are colored 'A'.
// If a player cannot make a move on their turn, 
// that player loses and the other player wins.
// Assuming Alice and Bob play optimally, return true if Alice wins, 
// or return false if Bob wins.

// Time: O(n), Space: O(1)
func winnerOfGame(_ colors: String) -> Bool {
    if colors.count == 1 { return false }
    
    let colors = Array(colors)
    var alice = 0, bob = 0

    for i in 1..<colors.count - 1 {
        if colors[i] == "A" {
            if colors[i - 1] == "A", colors[i + 1] == "A" { alice += 1 }
        } else {
            if colors[i - 1] == "B", colors[i + 1] == "B" { bob += 1 }
        }
    }

    return alice > bob
}

print(winnerOfGame("AAABABB"))
print(winnerOfGame("AA"))
print(winnerOfGame("ABBBBBBBAAA"))