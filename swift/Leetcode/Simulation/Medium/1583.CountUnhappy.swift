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
    var preferenceDict = [[Int: Int]]()

    for friends in preferences {
        var mapping = [Int: Int]()

        for (i, friend) in friends.enumerated() {
            mapping[friend] = i
        }

        preferenceDict.append(mapping)
    }

    var personToPair = [Int: Int]()

    for pair in pairs {
        personToPair[pair[0]] = pair[1]
        personToPair[pair[1]] = pair[0]
    }

    var result = 0

    for x in 0..<n {
        let y = personToPair[x]!

        for u in preferences[x] {
            if u == y { break }

            let v = personToPair[u]!

            if preferenceDict[x][u]! < preferenceDict[x][y]!, 
                preferenceDict[u][x]! < preferenceDict[u][v]! {
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