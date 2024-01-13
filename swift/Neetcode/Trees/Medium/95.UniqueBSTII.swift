// Given an integer n, return all the structurally unique BST's 
// (binary search trees), which has exactly n nodes of unique values from 1 to n. 
// Return the answer in any order.

func generateTrees(_ n: Int) -> [TreeNode?] {
    func generate(_ left: Int, _ right: Int) -> [TreeNode?] {
        if left > right { return [nil] }

        var result = [TreeNode?]()

        for i in left...right {
            for leftTree in generate(left, i - 1) {
                for rightTree in generate(i + 1, right) {
                    let root = TreeNode(i, leftTree, rightTree)
                    result.append(root)
                }
            }
        }

        return result
    }

    return generate(1, n)
}

print(generateTrees(3))
print(generateTrees(1))