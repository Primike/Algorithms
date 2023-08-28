// Given an integer array nums where the elements are sorted in ascending order, 
// convert it to a height-balanced binary search tree.

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    func convert(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let mid = (right + left) / 2
        var node = TreeNode(nums[mid])
        node.left = convert(left, mid - 1)
        node.right = convert(mid + 1, right)

        return node
    }

    return convert(0, nums.count - 1)
}