// You are given an integer array score of size n, 
// where score[i] is the score of the ith athlete in a competition. 
// All the scores are guaranteed to be unique.

// Time: O(n * logn), Space: O(n)
func findRelativeRanks(_ score: [Int]) -> [String] {
    var score = score.enumerated().map { ($0.offset, $0.element) }
    score.sort { $0.1 > $1.1 }
    var result = Array(repeating: "", count: score.count)
    
    if score.count >= 1 { result[score[0].0] = "Gold Medal" }
    if score.count >= 2 { result[score[1].0] = "Silver Medal" }
    if score.count >= 3 { result[score[2].0] = "Bronze Medal" }

    for i in 3..<max(3, score.count) {
        result[score[i].0] = "\(i + 1)"
    }

    return result
}

print(findRelativeRanks([5,4,3,2,1]))
print(findRelativeRanks([10,3,8,9,4]))