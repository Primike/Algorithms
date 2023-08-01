//Given an array of integers nums and an integer target, 
//return indices of the two numbers such that they add up to target.
//You may assume that each input would have exactly one solution, 
//and you may not use the same element twice.
//You can return the answer in any order.

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()

    for (i, number) in nums.enumerated() {
        if let index = dict[number] {
            return [index, i]
        }

        dict[target - number] = i
    }

    return []
}
    
print(twoSum([1, 2, 7, 11, 15], 9))
print(twoSum([3, 3], 6))