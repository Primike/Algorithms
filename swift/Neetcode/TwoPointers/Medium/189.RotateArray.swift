//Given an integer array nums, rotate the array to the right by k steps, 
//where k is non-negative.

func rotate(_ nums: inout [Int], _ k: Int) {
    func reverseArray(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var left = left
        var right = right
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }

    let k = k % nums.count

    reverseArray(&nums, 0, nums.count - 1)
    reverseArray(&nums, 0, k - 1)
    reverseArray(&nums, k, nums.count - 1)
}

print(rotate([1,2,3,4,5,6,7], 3))
print(rotate([-1,-100,3,99], 2))