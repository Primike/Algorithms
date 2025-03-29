// An element x of an integer array arr of length m is dominant 
// if more than half the elements of arr have a value of x.
// You are given a 0-indexed integer array nums of 
// length n with one dominant element.
// You can split nums at an index i into two arrays nums[0, ..., i] 
// and nums[i + 1, ..., n - 1], but the split is only valid if:
// 0 <= i < n - 1
// nums[0, ..., i], and nums[i + 1, ..., n - 1] have the same dominant element.
// Return the minimum index of a valid split. If no valid split exists, return -1.

// Time: O(n), Space: O(n)
func minimumIndex(_ nums: [Int]) -> Int {
    var dictRight = [Int: Int]()
    var validRight = Array(repeating: (0, false), count: nums.count)
    var maximum = nums[nums.count - 1]

    for i in (0..<nums.count).reversed() {
        dictRight[nums[i], default: 0] += 1

        if dictRight[nums[i]]! > dictRight[maximum]! { maximum = nums[i] }

        if dictRight[maximum]! > (nums.count - i) / 2 { 
            validRight[i] = (maximum, true)
        } else {
            validRight[i] = (maximum, false)
        }
    }
    
    var dictLeft = [Int: Int]()
    maximum = nums[0]

    for i in 0..<(nums.count - 1) {
        dictLeft[nums[i], default: 0] += 1

        if dictLeft[nums[i]]! > dictLeft[maximum]! { maximum = nums[i] }

        if dictLeft[maximum]! > (i + 1) / 2, validRight[i + 1].0 == maximum {
            if validRight[i + 1].1 { return i }
        }
    }

    return -1
}

print(minimumIndex([1,2,2,2]))
print(minimumIndex([2,1,3,1,1,1,7,1,2,1]))
print(minimumIndex([3,3,3,3,7,2,2]))