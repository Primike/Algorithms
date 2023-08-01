//Given an integer array nums, handle multiple queries of the following type:
//Calculate the sum of the elements of nums between indices left and 
//right inclusive where left <= right.

class NumArray {
    let nums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var count = 0

        for i in left...right {
            count += nums[i]
        }

        return count
    }

    func sumRange2(_ left: Int, _ right: Int) -> Int {
        return nums[left...right].reduce(0, +)
    }
}
