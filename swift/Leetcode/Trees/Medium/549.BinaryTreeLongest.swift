class Solution {
    func longestConsecutive(_ root: TreeNode?) -> Int {
        var ans = 0

        func dfs(_ node: TreeNode?) -> (inc: Int, dec: Int) {
            guard let node = node else { return (0, 0) }

            let left = dfs(node.left)
            let right = dfs(node.right)
            var inc = 1
            var dec = 1

            if let l = node.left {
                if l.val == node.val + 1 { inc = max(inc, left.inc + 1) }
                if l.val == node.val - 1 { dec = max(dec, left.dec + 1) }
            }

            if let r = node.right {
                if r.val == node.val + 1 { inc = max(inc, right.inc + 1) }
                if r.val == node.val - 1 { dec = max(dec, right.dec + 1) }
            }

            ans = max(ans, inc + dec - 1)
            return (inc, dec)
        }

        _ = dfs(root)
        return ans
    }
}