// Assuming Alice and Bob play optimally, return true if Alice wins, 
// or return false if Bob wins.

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