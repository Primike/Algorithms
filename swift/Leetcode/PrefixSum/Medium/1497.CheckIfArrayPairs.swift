// Given an array of integers arr of even length n and an integer k.
// We want to divide the array into exactly n / 2 pairs such that 
// the sum of each pair is divisible by k.
// Return true If you can find a way to do that or false otherwise.

// Negative remainders

// Time: O(n), Space: O(n)
func canArrange(_ arr: [Int], _ k: Int) -> Bool {
    var dict = [Int: Int]()

    for number in arr {
        let remainder = (number % k + k) % k
        let key = remainder == 0 ? 0 : k - remainder

        if let value = dict[key], value > 0 {
            dict[key] = value - 1
        } else {
            dict[remainder, default: 0] += 1
        }
    }

    return dict.values.allSatisfy { $0 == 0 }
}

print(canArrange([1,2,3,4,5,10,6,7,8,9], 5))
print(canArrange([1,2,3,4,5,6], 7))
print(canArrange([1,2,3,4,5,6], 10))