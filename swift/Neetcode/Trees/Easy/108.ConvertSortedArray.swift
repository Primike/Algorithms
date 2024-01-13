// Given an integer array nums where the elements are sorted in ascending order, 
// convert it to a height-balanced binary search tree.

// Time: O(n), Space: O(h)
func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    func dfs(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }
        
        let mid = (right + left) / 2
        let new = TreeNode(nums[mid])

        new.left = dfs(left, mid - 1)
        new.right = dfs(mid + 1, right)

        return new
    }

    return dfs(0, nums.count - 1)
}