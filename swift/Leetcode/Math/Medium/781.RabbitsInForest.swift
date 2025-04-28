// There is a forest with an unknown number of rabbits. 
// We asked n rabbits "How many rabbits have the same color as you?" 
// and collected the answers in an integer array answers 
// where answers[i] is the answer of the ith rabbit.
// Given the array answers, return the minimum number 
// of rabbits that could be in the forest.

// Time: O(n), Space: O(n)
func numRabbits(_ answers: [Int]) -> Int {
    let dict = answers.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0

    for (key, value) in dict {
        result += ((value + key) / (key + 1)) * (key + 1)
    }

    return result
}

print(numRabbits([1,1,2]))
print(numRabbits([10,10,10]))