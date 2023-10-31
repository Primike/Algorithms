/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var queue: [TreeNode?] = [root]
        var width = 0

        while !queue.isEmpty {
            var found = false
            var left = 0
            var right = 0

            for i in 0..<queue.count {
                let node = queue.removeFirst()

                if node != nil {
                    if found == false { 
                        left = i
                        found = true 
                    } 

                    right = i
                }

                if let current = node {
                    queue.append(current.left)
                    queue.append(current.right)
                }
            }

            width = max(width, right - left + 1)
        }

        return width
    }
}