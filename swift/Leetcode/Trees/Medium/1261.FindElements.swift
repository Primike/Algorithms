// Given a binary tree with the following rules:
// root.val == 0
// For any treeNode:
// If treeNode.val has a value x and treeNode.left != null, 
// then treeNode.left.val == 2 * x + 1
// If treeNode.val has a value x and treeNode.right != null, 
// then treeNode.right.val == 2 * x + 2
// Now the binary tree is contaminated, which means all 
// treeNode.val have been changed to -1.
// Implement the FindElements class:
// FindElements(TreeNode* root) Initializes the object with a 
// contaminated binary tree and recovers it.
// bool find(int target) Returns true if the target value exists 
// in the recovered binary tree.

// Time: O(n), Space: O(1)
class FindElements {

    private let root: TreeNode
    private var values = Set<Int>()
    
    init(_ root: TreeNode?) {
        let root = root!
        root.val = 0
        var stack = [root]
        
        while let node = stack.popLast() {
            values.insert(node.val)

            if let left = node.left {
                left.val = node.val * 2 + 1
                stack.append(left)
            }
            
            if let right = node.right {
                right.val = node.val * 2 + 2
                stack.append(right)
            }
        }
        
        self.root = root
    }
    
    func find(_ target: Int) -> Bool {
        return values.contains(target)
    }
}