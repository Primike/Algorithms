// You are given an integer array ribbons, 
// where ribbons[i] represents the length of the ith ribbon, 
// and an integer k. You may cut any of the ribbons into 
// any number of segments of positive integer lengths, 
// or perform no cuts at all.
// Your task is to determine the maximum length of ribbon, x, 
// that allows you to cut at least k ribbons, each of length x. 
// You can discard any leftover ribbon from the cuts. 
// If it is impossible to cut k ribbons of the same length, return 0.

// Time: O(n * log(n)), Space: O(1)
func maxLength(_ ribbons: [Int], _ k: Int) -> Int {
    if ribbons.reduce(0, +) < k { return 0 }

    var left = 1, right = ribbons.max() ?? 0

    while left <= right {
        let mid = (right + left) / 2
        var totalRibbons = 0

        for ribbon in ribbons {
            if totalRibbons == k { break }
            totalRibbons += ribbon / mid
        }

        if totalRibbons >= k {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }

    return right
}

print(maxLength([9,7,5], 3))
print(maxLength([7,5,9], 4))
print(maxLength([5,7,9], 22))