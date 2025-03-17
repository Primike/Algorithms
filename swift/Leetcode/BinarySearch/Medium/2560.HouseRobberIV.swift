// There are several consecutive houses along a street, 
// each of which has some money inside. 
// There is also a robber, who wants to steal money from the homes, 
// but he refuses to steal from adjacent homes.
// The capability of the robber is the maximum amount of money 
// he steals from one house of all the houses he robbed.
// You are given an integer array nums representing how much money is stashed 
// in each house. More formally, the ith house from the left has nums[i] dollars.
// You are also given an integer k, representing the minimum number of 
// houses the robber will steal from. It is always possible to steal at least k houses.
// Return the minimum capability of the robber out of all the possible ways 
// to steal at least k houses.

// Time: O(n * log(largest)), Space: O(1)
func minCapability(_ nums: [Int], _ k: Int) -> Int {
    var left = nums.min() ?? 0, right = nums.max() ?? 0

    while left < right {
        let mid = (right + left) / 2
        var count = 0
        var i = 0

        while i < nums.count, count < k {
            if nums[i] <= mid {
                count += 1
                i += 1
            }

            i += 1
        }

        if count >= k {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}

print(minCapability([2,3,5,9], 2))
print(minCapability([2,7,9,3,1], 2))