// Given an array of integers arr and two integers k and threshold, 
// return the number of sub-arrays of size k 
// and average greater than or equal to threshold.

func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
    var result = 0
    var left = 0, current = 0

    for (i, number) in arr.enumerated() {
        current += number
        if i + 1 < k { continue }

        if current / k >= threshold { result += 1 }
        current -= arr[left]
        left += 1
    }

    return result
}

print(numOfSubarrays([2,2,2,2,5,5,5,8], 3, 4))
print(numOfSubarrays([11,13,17,23,29,31,7,5,2,3], 3, 5))