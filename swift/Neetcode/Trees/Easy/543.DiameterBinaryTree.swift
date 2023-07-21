//Given the root of a binary tree, return the length of the diameter of the tree.

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    var result = 0

    func longestPath(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = longestPath(root.left)
        let right = longestPath(root.right)

        result = max(result, left + right)

        return max(left, right) + 1
    }

    longestPath(root)
    return result
}

