// The voting for this change is a round-based procedure. 
// In each round, each senator can exercise one of the two rights:
// Ban one senator's right: A senator can make another senator lose all 
// his rights in this and all the following rounds.
// Announce the victory: If this senator found the senators who still 
// have rights to vote are all from the same party, 
// he can announce the victory and decide on the change in the game.

// Time: O(n), Space: O(n)
func predictPartyVictory(_ senate: String) -> String {
    let senate = Array(senate)
    var rSenators = [Int]()
    var dSenators = [Int]()

    for i in 0..<senate.count {
        if senate[i] == "R" {
            rSenators.append(i)
        } else {
            dSenators.append(i)
        }
    }

    while !rSenators.isEmpty, !dSenators.isEmpty {
        let radiantIndex = rSenators.removeFirst()
        let direIndex = dSenators.removeFirst()

        if radiantIndex < direIndex {
            rSenators.append(radiantIndex + senate.count)
        } else {
            dSenators.append(direIndex + senate.count)
        }
    }

    return rSenators.isEmpty ? "Dire" : "Radiant"
}

print(predictPartyVictory("RD"))
print(predictPartyVictory("RDD"))