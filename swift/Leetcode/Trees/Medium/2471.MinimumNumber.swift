// You are given the root of a binary tree with unique values.
// In one operation, you can choose any two nodes at 
// the same level and swap their values.
// Return the minimum number of operations needed to make the values 
// at each level sorted in a strictly increasing order.

func minimumOperations(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    var queue: [TreeNode] = [root]
    var totalSwaps = 0
    
    while !queue.isEmpty {
        let levelSize = queue.count
        var levelValues: [Int] = []
        
        for _ in 0..<levelSize {
            let node = queue.removeFirst()
            levelValues.append(node.val)
            
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        
        var swaps = 0
        let target = levelValues.sorted()
        var pos = Dictionary(uniqueKeysWithValues: levelValues.enumerated().map { ($1, $0) })
        var original = levelValues
        
        for i in 0..<original.count {
            if original[i] != target[i] {
                swaps += 1
                
                let curPos = pos[target[i]]!
                pos[original[i]] = curPos
                original[curPos] = original[i]
            }
        }
        
        totalSwaps += swaps
    }
    
    return totalSwaps
}