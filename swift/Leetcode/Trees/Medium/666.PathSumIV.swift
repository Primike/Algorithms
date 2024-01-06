// Given an array of ascending three-digit integers nums 
// representing a binary tree with a depth smaller than 5, 
// return the sum of all paths from the root towards the leaves.
// It is guaranteed that the given array represents a valid 
// connected binary tree.

func pathSum(_ nums: [Int]) -> Int {
    var values = [Int: Int]()
    var result = 0

    func dfs(_ node: Int, _ current: Int = 0) {
        guard let value = values[node] else { return }

        let depth = node / 10, position = node % 10
        let left = (depth + 1) * 10 + 2 * position - 1
        let right = left + 1

        if values[left] == nil, values[right] == nil {
            result += current + value
        } else {
            dfs(left, current + value)
            dfs(right, current + value)
        }
    }

    for number in nums {
        let node = number / 10
        let value = number % 10
        values[node] = value
    }

    dfs(nums[0] / 10)
    return result
}

print(pathSum([113,215,221]))
print(pathSum([113,221]))