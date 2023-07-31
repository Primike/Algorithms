// Given an integer array nums representing the amount of money of each house, 
// return the maximum amount of money you can rob tonight.

func rob(_ nums: [Int]) -> Int {
    var rob1 = 0, rob2 = 0

    for number in nums {
        var temp = max(number + rob1, rob2)
        rob1 = rob2
        rob2 = temp
    }

    return rob2
}

print(rob([1,2,3,1]))
print(rob([2,7,9,3,1]))
