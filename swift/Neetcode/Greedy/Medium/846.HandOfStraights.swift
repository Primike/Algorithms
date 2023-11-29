// Alice has some number of cards and she wants to rearrange the cards into groups 
// so that each group is of size groupSize, and consists of groupSize consecutive cards.
// Given an integer array hand where hand[i] is the value written on the ith card 
// and an integer groupSize, return true if she can rearrange the cards, or false otherwise.

// Use Heap for better min
func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
    if hand.count % groupSize != 0 { return false }

    var dict = hand.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var count = 0

    while count < hand.count {
        var current = dict.keys.min() ?? -1

        for i in 0..<groupSize {
            if !dict.keys.contains(current) { return false }

            dict[current, default: 1] -= 1
            if dict[current, default: 0] == 0 { dict[current] = nil }

            current += 1
        } 

        count += groupSize
    }

    return true
}

print(isNStraightHand([1,2,3,6,2,3,4,7,8], 3))
print(isNStraightHand([1,2,3,4,5], 4))