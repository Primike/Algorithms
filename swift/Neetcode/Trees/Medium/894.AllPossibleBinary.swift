// Given an integer n, return a list of all possible full binary trees with n nodes. 
// Each node of each tree in the answer must have Node.val == 0.
// Each element of the answer is the root node of one possible tree. 
// You may return the final list of trees in any order.
// A full binary tree is a binary tree where each node has exactly 0 or 2 children.

// Time: O(2^n), Space: O(2^n)
func allPossibleFBT(_ n: Int) -> [TreeNode?] {
    if n % 2 == 0 { return [] }
    if n == 1 { return [TreeNode(0)] }

    var result = [TreeNode?]()

    for leftNodes in stride(from: 1, to: n, by: 2) {
        let rightNodes = n - 1 - leftNodes

        for left in allPossibleFBT(leftNodes) {
            for right in allPossibleFBT(rightNodes) {
                let root = TreeNode(0, left, right) 
                result.append(root)
            }
        }
    }

    return result
}

print(allPossibleFBT(7))
print(allPossibleFBT(3))