// Given an array of ascending three-digit integers nums 
// representing a binary tree with a depth smaller than 5, 
// return the sum of all paths from the root towards the leaves.
// It is guaranteed that the given array represents a valid 
// connected binary tree.

// Time: O(n), Space: O(n)
func pathSum(_ nums: [Int]) -> Int {
    let nums = nums.map { String($0).compactMap { Int(String($0)) } }
    var nodes = [[Int]: Int]()

    for node in nums {
        nodes[[node[0], node[1]]] = node[2]
    }

    var visited = Set<[Int]>()
    var result = 0

    func dfs(_ key: [Int], _ total: Int) -> Bool {
        guard let value = nodes[key] else { return false }

        if visited.contains(key) { return true }
        visited.insert(key)

        let left = dfs([key[0] + 1, 2 * key[1] - 1], total + value)
        let right = dfs([key[0] + 1, 2 * key[1]], total + value)

        if !left, !right { result += total + value }

        return true
    }

    dfs([1, 1], 0)
    return result
}

print(pathSum([113,215,221]))
print(pathSum([113,221]))