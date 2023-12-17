// Given an integer array nums, rotate the array to the right by k steps, 
// where k is non-negative.

func rotate(_ nums: inout [Int], _ k: Int) {
    if k % nums.count == 0 { return }

    let k = k % nums.count
    nums = Array(nums.reversed())
    let left = nums[0..<k], right = nums[k...]

    nums = Array(left.reversed()) + right.reversed()
}

print(rotate([1,2,3,4,5,6,7], 3))
print(rotate([-1,-100,3,99], 2))

func rotate2(_ nums: inout [Int], _ k: Int) {
    let k = k % nums.count
    var swaps = 0
    var start = 0

    while swaps < nums.count {
        var i = start
        var number = nums[i]
        var index = (i + k) % nums.count

        while true {
            let temp = nums[index]
            nums[index] = number

            number = temp
            i = index
            index = (i + k) % nums.count
            swaps += 1

            if i == start { break }
        }
        
        start += 1
    }
}