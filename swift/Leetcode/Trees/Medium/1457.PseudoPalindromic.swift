// Given a binary tree where node values are digits from 1 to 9. 
// A path in the binary tree is said to be pseudo-palindromic 
// if at least one permutation of the node values in the path is a palindrome.
// Return the number of pseudo-palindromic paths going from the root node to leaf nodes.

// Time: O(n), Space: O(n)
func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
    var result = 0

    func checkPalindrome(_  dict: [Int: Int]) {
        var count = 0

        for (key, value) in dict {
            if value % 2 != 0 { count += 1 }
        }

        result += count > 1 ? 0 : 1
    }

    func dfs(_ root: TreeNode?, _ dict: [Int: Int]) -> TreeNode? {
        guard let root = root else { return nil }

        var dict = dict
        dict[root.val, default: 0] += 1

        let left = dfs(root.left, dict), right = dfs(root.right, dict)

        if left == nil, right == nil { checkPalindrome(dict) }

        return root
    }

    dfs(root, [:])
    return result
}