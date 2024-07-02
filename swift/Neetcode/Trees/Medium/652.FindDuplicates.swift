// Given the root of a binary tree, return all duplicate subtrees.
// For each kind of duplicate subtrees, you only need to return 
// the root node of any one of them.
// Two trees are duplicate if they have the same structure with the same node values.

// Time: O(n), Space: O(n)
func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    var ids = [[Int]: Int]()
    var count = [Int: Int]()
    var result = [TreeNode?]()

    func dfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }

        let triplet = [dfs(node.left), node.val, dfs(node.right)]

        if ids[triplet] == nil { ids[triplet] = ids.count + 1 }
        let id = ids[triplet]!

        if count[id] == 1 { result.append(node) }
        count[id, default: 0] += 1

        return id
    }

    dfs(root)
    return result
}

// Time: O(n^2), Space: O(n^2)
func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    var subTrees = Set<String>()
    var result = [String: TreeNode]()

    func dfs(_ root: TreeNode?) -> String {
        guard let root = root else { return "null" }

        let left = dfs(root.left)
        let right = dfs(root.right)
        let string = left + "," + right + ",\(root.val)"
        
        if subTrees.contains(string) { result[string] = root }
        subTrees.insert(string)

        return string
    }

    dfs(root)
    return Array(result.values)
}