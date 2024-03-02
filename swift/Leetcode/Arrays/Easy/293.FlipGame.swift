// You are given a string currentState that contains only '+' and '-'. 
// You and your friend take turns to flip two consecutive "++" into "--". 
// The game ends when a person can no longer make a move, 
// and therefore the other person will be the winner.
// Return all possible states of the string currentState after one valid move. 
// You may return the answer in any order. If there is no valid move, 
// return an empty list [].

// Time: O(n^2), Space: O(n)
func generatePossibleNextMoves(_ currentState: String) -> [String] {
    let currentState = Array(currentState)
    var result = [String]()

    for i in 1..<currentState.count {
        let string = String(currentState[i - 1]) + String(currentState[i])

        if string == "++" { 
            result.append(currentState[..<(i - 1)] + "--" + currentState[(i + 1)...])
        }
    }

    return result
}

print(generatePossibleNextMoves("++++"))
print(generatePossibleNextMoves("+"))