// Given an integer array nums and an integer k, 
// you are asked to construct the array ans of size n-k+1 
// where ans[i] is the number of distinct numbers 
// in the subarray nums[i:i+k-1] = [nums[i], nums[i+1], ..., nums[i+k-1]].
// Return the array ans.

func distinctNumbers(_ nums: [Int], _ k: Int) -> [Int] {
    let maxValue = nums.max() ?? 0
    var freq = [Int](repeating: 0, count: maxValue + 1)
    var distinct = 0
    var answer = [Int]()
    for pos in 0..<nums.count {
        let num = nums[pos]
        freq[num] += 1
        if freq[num] == 1 { distinct += 1 }
        if pos >= k {
            let oldNum = nums[pos - k]
            freq[oldNum] -= 1
            if freq[oldNum] == 0 { distinct -= 1 }
        }
        if pos + 1 >= k { answer.append(distinct) }
    }
    return answer
}

print(distinctNumbers([1,2,3,2,2,1,3], 3))
print(distinctNumbers([1,1,1,1,2,3,4], 4))