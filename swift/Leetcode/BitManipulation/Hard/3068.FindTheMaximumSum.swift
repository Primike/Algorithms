// Alice wants the sum of values of tree nodes to be maximum, 
// for which Alice can perform the following operation 
// any number of times (including zero) on the tree:
// Choose any edge [u, v] connecting the nodes u and v, 
// and update their values as follows:
// nums[u] = nums[u] XOR k
// nums[v] = nums[v] XOR k
// Return the maximum possible sum of the values Alice can achieve 
// by performing the operation any number of times.

func maximumValueSum(_ nums: [Int], _ k: Int, _ edges: [[Int]]) -> Int {
    var netChange = nums.map { ($0 ^ k) - $0 }
    var result = nums.reduce(0, +)
    netChange.sort(by: >)

    for i in stride(from: 0, to: nums.count, by: 2) {
        if i + 1 == nums.count { break }

        let pairSum = netChange[i] + netChange[i + 1]
        if pairSum > 0 { result += pairSum }
    }

    return result
}

print(maximumValueSum([1,2,1], 3, [[0,1],[0,2]]))
print(maximumValueSum([2,3], 7, [[0,1]]))
print(maximumValueSum([7,7,7,7,7,7], 3, [[0,1],[0,2],[0,3],[0,4],[0,5]]))