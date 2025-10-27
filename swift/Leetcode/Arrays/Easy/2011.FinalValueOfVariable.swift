// There is a programming language with only four operations and one variable X:
// ++X and X++ increments the value of the variable X by 1.
// --X and X-- decrements the value of the variable X by 1.
// Initially, the value of X is 0.
// Given an array of strings operations containing a list of operations, 
// return the final value of X after performing all the operations.

// Time: O(n), Space: O(1)
func finalValueAfterOperations(_ operations: [String]) -> Int {
    var dict = ["++X": 1, "X++": 1, "--X": -1, "X--": -1]
    var result = 0

    for string in operations {
        result += dict[string, default: 0]
    }

    return result
}

print(finalValueAfterOperations(["--X","X++","X++"]))
print(finalValueAfterOperations(["++X","++X","X++"]))
print(finalValueAfterOperations(["X++","++X","--X","X--"]))