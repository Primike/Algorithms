// You have n binary tree nodes numbered from 0 to n - 1 
// where node i has two children leftChild[i] and rightChild[i], 
// return true if and only if all the given nodes form 
// exactly one valid binary tree.
// If node i has no left child then leftChild[i] will equal -1, 
// similarly for the right child.

// Time: O(n), Space: O(n)
func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
    let leftSet = Set(leftChild), rightSet = Set(rightChild)
    var root = -1

    for i in 0..<n {
        if !leftSet.contains(i), !rightSet.contains(i) { 
            if root != -1 { return false }
            root = i
        }
    }

    var visited = Set<Int>()

    func dfs(_ n: Int) -> Bool {
        if visited.contains(n) { return false }
        if n == -1 { return true }

        visited.insert(n)

        return dfs(leftChild[n]) && dfs(rightChild[n])
    }

    return dfs(root) && visited.count == n
}

print(validateBinaryTreeNodes(4, [1,-1,3,-1], [2,-1,-1,-1]))
print(validateBinaryTreeNodes(4, [1,-1,3,-1], [2,3,-1,-1]))
print(validateBinaryTreeNodes(2, [1,0], [-1,-1]))