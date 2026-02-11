class Solution {
    private func dfs(_ node: TreeNode?, _ level: Int, _ sumOfNodesAtLevel: inout [Int]) {
        guard let node = node else {
            return
        }

        if sumOfNodesAtLevel.count == level {
            sumOfNodesAtLevel.append(node.val)
        } else {
            sumOfNodesAtLevel[level] += node.val
        }

        dfs(node.left, level + 1, &sumOfNodesAtLevel)
        dfs(node.right, level + 1, &sumOfNodesAtLevel)
    }

    func maxLevelSum(_ root: TreeNode?) -> Int {
        var sumOfNodesAtLevel = [Int]()
        dfs(root, 0, &sumOfNodesAtLevel)

        var maxSum = Int.min
        var ans = 0

        for i in 0..<sumOfNodesAtLevel.count {
            if maxSum < sumOfNodesAtLevel[i] {
                maxSum = sumOfNodesAtLevel[i]
                ans = i + 1
            }
        }

        return ans
    }
}