// Given a binary array nums, return the maximum number of consecutive 1's 
// in the array if you can flip at most one 0.

// Time: O(n), Space: O(n)
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var array = [Int]()
    var count = 0

    for number in nums {
        if number == 0 { 
            if count > 0 { array.append(count) }
            
            array.append(0) 
            count = 0 
        } else {
            count += 1
        }
    }

    if count > 0 { array.append(count) }

    var result = max(array.max() ?? 0, 1)

    for i in 0..<array.count {
        if array[i] == 0 {
            let left = i > 0 ? array[i - 1] : 0
            let right = i < array.count - 1 ? array[i + 1] : 0
            result = max(result, left + 1 + right)
        }
    }

    return result
}

print(findMaxConsecutiveOnes([1,0,1,1,0]))
print(findMaxConsecutiveOnes([1,0,1,1,0,1]))