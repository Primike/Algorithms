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
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        var rootToLeaf = 0
        var currNumber = 0
        var node = root
        
        while let current = node {
            if let leftChild = current.left {
                var predecessor = leftChild
                var steps = 1
                while let right = predecessor.right, right !== current {
                    predecessor = right
                    steps += 1
                }
                
                if predecessor.right == nil {
                    currNumber = (currNumber << 1) | current.val
                    predecessor.right = current
                    node = current.left
                } else {
                    if predecessor.left == nil {
                        rootToLeaf += currNumber
                    }
                    for _ in 0..<steps {
                        currNumber >>= 1
                    }
                    predecessor.right = nil
                    node = current.right
                }
            } else {
                currNumber = (currNumber << 1) | current.val
                if current.right == nil {
                    rootToLeaf += currNumber
                }
                node = current.right
            }
        }
        
        return rootToLeaf
    }
}