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

func rotate2(_ nums: inout [Int], _ k: Int) {
    let k = k % nums.count
    var count = 0
    var start = 0

    while count < nums.count {
        var currentIndex = start
        var number = nums[start]
        var nextIndex = (currentIndex + k) % nums.count

        while true {
            let nextNumber = nums[nextIndex]
            nums[nextIndex] = number
            number = nextNumber
            currentIndex = nextIndex
            nextIndex = (currentIndex + k) % nums.count
            count += 1

            if currentIndex == start { break }
        }
        
        start += 1
    }
}
