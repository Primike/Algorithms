// You are given a 0-indexed integer array candies. 
// Each element in the array denotes a pile of candies of size candies[i]. 
// You can divide each pile into any number of sub piles, 
// but you cannot merge two piles together.
// You are also given an integer k. You should allocate 
// piles of candies to k children such that each child 
// gets the same number of candies. Each child can be allocated candies 
// from only one pile of candies and some piles of candies may go unused.
// Return the maximum number of candies each child can get.

// Time: O(n * log(n)), Space: O(1)
func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
    if candies.reduce(0, +) < k { return 0 }
    
    var left = 1, right = candies.max() ?? 0

    while left <= right {
        let mid = (right + left) / 2
        var count = 0

        for pile in candies {
            if count >= k { break }
            count += pile / mid
        }

        if count >= k {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return right
}

print(maximumCandies([5,8,6], 3))
print(maximumCandies([2,5], 11))