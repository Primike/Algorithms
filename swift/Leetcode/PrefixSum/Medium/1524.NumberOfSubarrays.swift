// Given an array of integers arr, return the number of 
// subarrays with an odd sum.
// Since the answer can be very large, return it modulo 109 + 7.

func numOfSubarrays(_ arr: [Int]) -> Int {
    let mod = 1_000_000_007
    var result = 0
    var even = 1, odd = 0
    var sum = 0

    for number in arr {
        sum += number 

        if sum % 2 == 0 {
            result += odd
            even += 1
        } else {
            result += even
            odd += 1
        }

        result %= mod
    }

    return result 
}

print(numOfSubarrays([1,3,5]))
print(numOfSubarrays([2,4,6]))
print(numOfSubarrays([1,2,3,4,5,6,7]))