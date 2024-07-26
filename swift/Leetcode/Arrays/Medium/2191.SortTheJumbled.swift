// You are given a 0-indexed integer array mapping which represents 
// the mapping rule of a shuffled decimal system. mapping[i] = j means 
// digit i should be mapped to digit j in this system.
// You are also given another integer array nums. 
// Return the array nums sorted in non-decreasing order 
// based on the mapped values of its elements.

// Time: O(n * log(n)), Space: O(n)
func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
    var result = [(Int, Int, Int)]()

    for i in 0..<nums.count {
        let number = Array(String(nums[i])).map { String($0) }
        let transformed = Int(number.map { String(mapping[Int($0) ?? 0]) }.joined()) ?? 0
        result.append((nums[i], transformed, i))
    }

    result.sort { ($0.1, $0.2) < ($1.1, $1.2) }
    return result.map { $0.0 }
}

print(sortJumbled([8,9,4,0,2,1,3,5,7,6], [991,338,38]))
print(sortJumbled([0,1,2,3,4,5,6,7,8,9], [789,456,123]))