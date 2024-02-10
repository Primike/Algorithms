// Alice has some number of cards and she wants to rearrange the cards into groups 
// so that each group is of size groupSize, and consists of groupSize consecutive cards.
// Given an integer array hand where hand[i] is the value written on the ith card 
// and an integer groupSize, return true if she can rearrange the cards, or false otherwise.

// Use heap instead of min

// Time: O(n^2), Space: O(n)
func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
    if hand.count % groupSize != 0 { return false }

    var dict = hand.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    let partitions = hand.count / groupSize

    for i in 0..<partitions {
        var smallest = dict.keys.min() ?? 0

        for j in smallest..<(smallest + groupSize) {
            if !dict.keys.contains(j) { return false }

            dict[j, default: 0] -= 1

            if dict[j, default: 0] == 0 { dict[j] = nil }
        }
    }

    return true
}

print(isNStraightHand([1,2,3,6,2,3,4,7,8], 3))
print(isNStraightHand([1,2,3,4,5], 4))