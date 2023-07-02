//Given an array of integers nums which is sorted in ascending order, 
//and an integer target, write a function to search target in nums. 
//If target exists, then return its index. Otherwise, return -1.

func search(_ nums: [Int], _ target: Int) -> Int {
    var left = 0, right = nums.count - 1

    while left <= right {
        var mid = (right + left) / 2

        if nums[mid] > target {
            right = mid - 1
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            return mid
        }
    }

    return -1
}

print(search([-1,0,3,5,9,12], 9))
print(search([-1,0,3,5,9,12], 2))