class Solution {
    func maxProduct(_ root: TreeNode?) -> Int {
        var allSums = [Int]()

        func treeSum(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let leftSum = treeSum(node.left)
            let rightSum = treeSum(node.right)
            let totalSum = leftSum + rightSum + node.val
            allSums.append(totalSum)
            return totalSum
        }

        let total = treeSum(root)
        var best = 0
        for s in allSums {
            best = max(best, s * (total - s))
        }
        return best % 1_000_000_007
    }
}