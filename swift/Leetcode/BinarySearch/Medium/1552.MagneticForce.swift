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
    var left = 1, right = position[position.count - 1] - position[0]

    func canPlaceBalls(_ distance: Int) -> Bool {
        var count = 1
        var lastPosition = position[0]

        for i in 1..<position.count {
            if position[i] - lastPosition >= distance {
                count += 1
                lastPosition = position[i]
            }

            if count >= m { return true }
        }

        return false
    }

    while left < right {
        let mid = (right + left + 1) / 2

        if canPlaceBalls(mid) {
            left = mid
        } else {
            right = mid - 1
        }
    }

    return left
}

print(maxDistance([1,2,3,4,7], 3))
print(maxDistance([5,4,3,2,1,1000000000], 2))