//Given an integer array nums, 
//move all 0's to the end of it while maintaining the 
//relative order of the non-zero elements.

func moveZeroes(_ nums: inout [Int]) {
    var left = 0

    for (i, number) in nums.enumerated() {
        if number != 0 {
            nums.swapAt(left, i)
            left += 1
        }
    }
}

print(moveZeroes([0,1,0,3,12]))
print(moveZeroes([0]))