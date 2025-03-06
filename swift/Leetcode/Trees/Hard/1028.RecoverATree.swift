// We run a preorder depth-first search (DFS) on the root of a binary tree.
// At each node in this traversal, we output D dashes (where D is the depth of this node), 
// then we output the value of this node.  If the depth of a node is D, 
// the depth of its immediate child is D + 1.  The depth of the root node is 0.
// If a node has only one child, that child is guaranteed to be the left child.
// Given the output traversal of this traversal, recover the tree and return its root.

// Time: O(n), Space: O(n)
func recoverFromPreorder(_ traversal: String) -> TreeNode? {
    let traversal = Array(traversal)
    var preorder = [(Int, Int)]()
    var i = 0

    while i < traversal.count {
        var level = 0

        while i < traversal.count, traversal[i] == "-" {
            level += 1
            i += 1
        }

        var number = ""

        while i < traversal.count, traversal[i].isNumber {
            number.append(traversal[i])
            i += 1
        }

        preorder.append((level, Int(number)!))
    }

    i = 0

    func dfs(_ level: Int) -> TreeNode? {
        if i >= preorder.count { return nil }
        if preorder[i].0 != level { return nil }

        let node = TreeNode(preorder[i].1)
        i += 1
        node.left = dfs(level + 1)
        node.right = dfs(level + 1)

        return node
    }

    return dfs(0)
}

print(recoverFromPreorder("1-2--3--4-5--6--7"))
print(recoverFromPreorder("1-2--3---4-5--6---7"))
print(recoverFromPreorder("1-401--349---90--88"))