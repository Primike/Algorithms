// Given the root of a perfect binary tree, reverse the node values 
// at each odd level of the tree.
// For example, suppose the node values at level 3 are 
// [2,1,3,4,7,11,29,18], then it should become [18,29,11,7,4,3,1,2].
// Return the root of the reversed tree.
// A binary tree is perfect if all parent nodes have two children and all leaves are on the same level.

func reverseOddLevels(_ root: TreeNode?) -> TreeNode? {
    func dfs(_ left: TreeNode?, _ right: TreeNode?, _ level: Int) {
        guard let left = left, let right = right else { return }

        if level % 2 == 0 {
            let temp = left.val
            left.val = right.val
            right.val = temp
        }
        
        dfs(left.left, right.right, level + 1)
        dfs(left.right, right.left, level + 1)
    }
    
    dfs(root?.left, root?.right, 0)
    return root
}