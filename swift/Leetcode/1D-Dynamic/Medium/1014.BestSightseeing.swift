// You are given an integer array values where values[i] 
// represents the value of the ith sightseeing spot. 
// Two sightseeing spots i and j have a distance j - i between them.
// The score of a pair (i < j) of sightseeing spots is 
// values[i] + values[j] + i - j: the sum of the values 
// of the sightseeing spots, minus the distance between them.
// Return the maximum score of a pair of sightseeing spots.

func maxScoreSightseeingPair(_ values: [Int]) -> Int {
    var result = 0
    var i = 0
    
    for j in 1..<values.count {
        result = max(result, values[i] + values[j] + i - j)
        if values[i] + i < values[j] + j { i = j }
    }

    return result
}

print(maxScoreSightseeingPair([8,1,5,2,6]))
print(maxScoreSightseeingPair([1,2]))