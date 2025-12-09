// Given the roots of two binary search trees, root1 and root2, 
// return true if and only if there is a node in the first tree 
// and a node in the second tree whose values sum up to a given integer target.

// Time: O(n), Space: O(n)
func twoSumBSTs(_ root1: TreeNode?, _ root2: TreeNode?, _ target: Int) -> Bool {
    guard let root1, let root2 else { return false }

    var root1Values = Set<Int>()
    var stack = [TreeNode]()
    var current: TreeNode? = root1

    while !stack.isEmpty || current != nil {
        while let node = current {
            stack.append(node)
            current = node.left
        }

        let last = stack.removeLast()
        root1Values.insert(last.val)
        current = last.right
    }

    current = root2

    while !stack.isEmpty || current != nil {
        while let node = current {
            stack.append(node)
            current = node.left

            if root1Values.contains(target - node.val) { return true }
        }

        let last = stack.removeLast()
        current = last.right
    }

    return false
}