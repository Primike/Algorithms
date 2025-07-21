// Given a binary array data, return the minimum number of swaps required 
// to group all 1’s present in the array together in any place in the array.

// Time: O(n), Space: O(1)
func minSwaps(_ data: [Int]) -> Int {
    var totalOnes = data.filter { $0 == 1 }.count
    if totalOnes == 0 { return 0 }
    var result = totalOnes
    var zeros = 0

    for i in 0..<data.count {
        if data[i] == 0 { zeros += 1 }
        if i < totalOnes - 1 { continue }
        result = min(result, zeros)
        if data[i - totalOnes + 1] == 0 { zeros -= 1 }
    }

    return result
}

print(minSwaps([1,0,1,0,1]))
print(minSwaps([0,0,0,1,0]))
print(minSwaps([1,0,1,0,1,0,0,1,1,0,1]))