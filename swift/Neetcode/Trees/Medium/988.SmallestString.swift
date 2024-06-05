// You are given the root of a binary tree where each node 
// has a value in the range [0, 25] representing the letters 'a' to 'z'.
// Return the lexicographically smallest string that 
// starts at a leaf of this tree and ends at the root.

// Time: O(n), Space: O(h)
func smallestFromLeaf(_ root: TreeNode?) -> String {
    var result = ""
    
    func dfs(_ node: TreeNode?, _ string: String) {
        guard let node = node else { return }

        let letter = String(Character(UnicodeScalar(node.val + 97)!))
        let newString = letter + string

        if node.left == nil, node.right == nil {
            if result.isEmpty || result > newString { result = newString }
        }

        dfs(node.left, newString)
        dfs(node.right, newString)
    }
    
    dfs(root, "")
    return result
}