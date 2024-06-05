// Given a binary tree where node values are digits from 1 to 9. 
// A path in the binary tree is said to be pseudo-palindromic 
// if at least one permutation of the node values in the path is a palindrome.
// Return the number of pseudo-palindromic paths going from the root node to leaf nodes.

// Time: O(n), Space: O(n)
func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
    func checkPalindrome(_ path: [Int: Int]) -> Bool {
        return path.values.filter { $0 % 2 != 0 }.count <= 1
    }

    var result = 0

    func dfs(_ root: TreeNode?, _ current: [Int: Int]) {
        guard let root = root else { return }

        var current = current
        current[root.val, default: 0] += 1

        dfs(root.left, current)
        dfs(root.right, current)

        if root.left == nil, root.right == nil { 
            result += checkPalindrome(current) ? 1 : 0
        }
    }

    dfs(root, [:])
    return result
}