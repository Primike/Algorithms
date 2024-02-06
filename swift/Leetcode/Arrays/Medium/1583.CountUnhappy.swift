// All the friends are divided into pairs. The pairings are given in a list pairs, 
// where pairs[i] = [xi, yi] denotes xi is paired with yi and yi is paired with xi.
// However, this pairing may cause some of the friends to be unhappy. 
// A friend x is unhappy if x is paired with y and there exists a friend 
// u who is paired with v but:
// x prefers u over y, and
// u prefers x over v.
// Return the number of unhappy friends.

// Time: O(n * m), Space: O(n * m)
func unhappyFriends(_ n: Int, _ preferences: [[Int]], _ pairs: [[Int]]) -> Int {
    var biases = [Int: [Int: Int]]()

    for i in 0..<n {
        var preference = [Int: Int]()

        for (pair, friend) in preferences[i].enumerated() {
            preference[friend] = pair
        }

        biases[i] = preference
    }

    var pairDict = [Int: Int]()

    for pair in pairs {
        pairDict[pair[0]] = pair[1]
        pairDict[pair[1]] = pair[0]
    }

    var result = 0

    for i in 0..<n {
        let pair = pairDict[i]!

        for friend in preferences[i] {
            if friend == pair { break }

            let friendPair = pairDict[friend]!

            if biases[i]![friend]! < biases[i]![pair]!, 
                biases[friend]![i]! < biases[friend]![friendPair]! {
                result += 1
                break
            }
        }
    }

    return result
}

print(unhappyFriends(4, [[1, 2, 3], [3, 2, 0], [3, 1, 0], [1, 2, 0]], [[0, 1], [2, 3]]))
print(unhappyFriends(2, [[1], [0]], [[1, 0]]))
print(unhappyFriends(4, [[1, 3, 2], [2, 3, 0], [1, 3, 0], [0, 2, 1]], [[1, 3], [0, 2]]))