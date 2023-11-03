// Given an integer n, return the number of structurally unique BST's 
// (binary search trees) which has exactly n nodes of unique values from 1 to n.

func numTrees(_ n: Int) -> Int {
    var trees = Array(repeating: 1, count: n + 1)

    for nodes in 2..<n + 1 {
        var total = 0

        for root in 1..<nodes + 1 {
            var left = root - 1
            var right = nodes - root
            total += trees[left] * trees[right]
        }

        trees[nodes] = total
    }

    return trees[n]
}

print(numTrees(3))
print(numTrees(1))