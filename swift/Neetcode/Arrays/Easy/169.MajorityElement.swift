//Given an array nums of size n, return the majority element.

func majorityElement(_ nums: [Int]) -> Int {
    var count = 0
    var current = 0

    for number in nums {
        if count == 0 {
            current = number 
        } 
        
        count += (number == current) ? 1 : -1
    }

    return current
}

print(majorityElement([3,2,3]))
print(majorityElement([2,2,1,1,1,2,2]))