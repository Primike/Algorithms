// In the universe Earth C-137, Rick discovered a special form of magnetic force 
// between two balls if they are put in his new invented basket. 
// Rick has n empty baskets, the ith basket is at position[i], 
// Morty has m balls and needs to distribute the balls into the baskets 
// such that the minimum magnetic force between any two balls is maximum.
// Rick stated that magnetic force between two different balls 
// at positions x and y is |x - y|.
// Given the integer array position and the integer m. Return the required force.

// Time: O(n * log(n)), Space: O(1)
func maxDistance(_ position: [Int], _ m: Int) -> Int {
    let position = position.sorted()
    var left = 1, right = position.max() ?? 0
    var result = 0

    while left < right {
        let mid = (right + left) / 2
        var balls = 1
        var last = position[0]
        
        for i in 1..<position.count {
            if balls == m { break }

            if position[i] - last >= mid {
                balls += 1
                last = position[i]
            }
        }

        if balls >= m {
            left = mid + 1
            result = max(result, mid)
        } else {
            right = mid
        }
    }

    return result
}

print(maxDistance([1,2,3,4,7], 3))
print(maxDistance([5,4,3,2,1,1000000000], 2))