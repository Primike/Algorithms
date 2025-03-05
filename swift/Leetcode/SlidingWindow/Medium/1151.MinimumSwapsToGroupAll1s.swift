// Given a binary array data, return the minimum number of swaps required 
// to group all 1’s present in the array together in any place in the array.

// Time: O(n), Space: O(1)
func minSwaps(_ data: [Int]) -> Int {
    let target = data.filter { $0 == 1 }.count
    var result = Int.max
    var left = 0
    var ones = 0

    for i in 0..<data.count {
        if data[i] == 1 { ones += 1 }
        if i >= target - 1 {
            result = min(result, target - ones)
            ones -= data[left] == 1 ? 1 : 0
            left += 1
        }
    }

    return result
}

print(minSwaps([1,0,1,0,1]))
print(minSwaps([0,0,0,1,0]))
print(minSwaps([1,0,1,0,1,0,0,1,1,0,1]))