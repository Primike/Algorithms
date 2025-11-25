// Given an array of ascending three-digit integers nums 
// representing a binary tree with a depth smaller than 5, 
// return the sum of all paths from the root towards the leaves.
// It is guaranteed that the given array represents a valid 
// connected binary tree.

// Time: O(n), Space: O(n)
func pathSum(_ nums: [Int]) -> Int {
    var nodes = [[Int]: Int]()

    for number in nums {
        nodes[[(number / 10) % 10, number / 100]] = number % 10
    }

    var stack = [([1, 1], 0)]
    var result = 0

    while !stack.isEmpty {
        var (last, total) = stack.removeLast()
        guard let value = nodes[last] else { return result }

        let left = [last[0] * 2 - 1, last[1] + 1]
        let right = [last[0] * 2, last[1] + 1]

        if nodes[left] != nil { stack.append((left, total + value)) }
        if nodes[right] != nil { stack.append((right, total + value)) }
        if nodes[left] == nil, nodes[right] == nil { result += total + value }
    }

    return result
}

print(pathSum([113,215,221]))
print(pathSum([113,221]))


func pathSum2(_ nums: [Int]) -> Int {
    var nodes = [[Int]: Int]()

    for number in nums {
        nodes[[(number / 10) % 10, number / 100]] = number % 10
    }

    var result = 0

    func dfs(_ node: [Int], _ total: Int) -> Bool {
        guard let value = nodes[node] else { return false }

        let left = dfs([node[0] * 2 - 1, node[1] + 1], total + value)
        let right = dfs([node[0] * 2, node[1] + 1], total + value)

        if !left, !right { result += total + value }

        return true
    }

    dfs([1, 1], 0)
    return result
}