// Given an integer n, return a list of all possible full binary trees with n nodes. 
// Each node of each tree in the answer must have Node.val == 0.
// Each element of the answer is the root node of one possible tree. 
// You may return the final list of trees in any order.
// A full binary tree is a binary tree where each node has exactly 0 or 2 children.

// Time: O(2^n), Space: O(2^n)
func allPossibleFBT(_ n: Int) -> [TreeNode?] {
    if n == 1 { return [TreeNode(0)] }
    if n % 2 == 0 || n < 1 { return [] }

    var result = [TreeNode?]()

    for i in stride(from: 1, to: n, by: 2) {
        let leftTrees = allPossibleFBT(i)
        let rightTrees = allPossibleFBT(n - i - 1)

        for left in leftTrees {
            for right in rightTrees {
                result.append(TreeNode(0, left, right))
            }
        }
    }

    return result
}

print(allPossibleFBT(7))
print(allPossibleFBT(3))