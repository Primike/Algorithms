//Given an array of integers arr and two integers k and threshold, 
//return the number of sub-arrays of size k 
//and average greater than or equal to threshold.

func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
    var result = 0
    var sum = 0
    var left = 0, right = 0

    while right < arr.count {
        sum += arr[right]
        right += 1

        if right - left < k {
            continue
        }

        if sum / k >= threshold {
            result += 1
        }

        sum -= arr[left]
        left += 1
    }

    return result
}

func numOfSubarrays2(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
    var result = 0
    var currentSum = arr.prefix(k - 1).reduce(0, +)
    
    for i in 0..<(arr.count - k + 1) {
        currentSum += arr[i + k - 1]

        if currentSum / k >= threshold {
            result += 1
        }

        currentSum -= arr[i]
    }
    
    return result
}

print(numOfSubarrays([2,2,2,2,5,5,5,8], 3, 4))
print(numOfSubarrays([11,13,17,23,29,31,7,5,2,3], 3, 5))