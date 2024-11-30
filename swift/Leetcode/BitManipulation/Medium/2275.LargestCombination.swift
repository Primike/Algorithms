// The bitwise AND of an array nums is the bitwise AND of all integers in nums.
// For example, for nums = [1, 5, 3], the bitwise AND is equal to 1 & 5 & 3 = 1.
// Also, for nums = [7], the bitwise AND is 7.
// You are given an array of positive integers candidates. 
// Evaluate the bitwise AND of every combination of numbers of candidates. 
// Each number in candidates may only be used once in each combination.
// Return the size of the largest combination of candidates 
// with a bitwise AND greater than 0.

func largestCombination(_ candidates: [Int]) -> Int {
    var result = 0
    
    for i in 0..<24 {
        var count = 0

        for num in candidates {
            if (num & (1 << i)) != 0 { count += 1 }
        }

        result = max(result, count)
    }
    
    return result
}

print(largestCombination([16,17,71,62,12,24,14]))
print(largestCombination([8,8]))