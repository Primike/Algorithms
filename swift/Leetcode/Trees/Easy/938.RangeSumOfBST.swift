// Given the root node of a binary search tree and two integers 
// low and high, return the sum of values of all nodes with a value 
// in the inclusive range [low, high].

// Time: O(n), Space: O(h)
func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    guard let root = root else { return 0 }

    var result = 0

    if root.val >= low, root.val <= high { result += root.val }
    if let left = root.left { result += rangeSumBST(left, low, high) }
    if let right = root.right { result += rangeSumBST(right, low, high) }

    return result
}