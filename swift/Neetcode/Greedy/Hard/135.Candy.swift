// You are giving candies to these children 
// subjected to the following requirements:
// Each child must have at least one candy.
// Children with a higher rating get more candies than their neighbors.
// Return the minimum number of candies you need to have to 
// distribute the candies to the children.

// Time: O(n), Space: O(n)
func candy(_ ratings: [Int]) -> Int {
    var result = Array(repeating: 1, count: ratings.count)

    for i in 1..<ratings.count {
        if ratings[i] > ratings[i - 1] {
            result[i] = result[i - 1] + 1
        }
    }

    for i in stride(from: ratings.count - 2, to: -1, by: -1) {
        if ratings[i] > ratings[i + 1] {
            result[i] = max(result[i], result[i + 1] + 1)
        }
    }

    return result.reduce(0, +)
}

print(candy([1,0,2]))
print(candy([1,2,2]))