// The level sum in the tree is the sum of the values of the nodes 
// that are on the same level.
// Return the kth largest level sum in the tree (not necessarily distinct). 
// If there are fewer than k levels in the tree, return -1.

func kthLargestLevelSum(_ root: TreeNode?, _ k: Int) -> Int {
    guard let root = root else { return -1 }

    var heap = Heap<Int>(.minHeap)
    var queue = [root]

    while !queue.isEmpty {
        var total = 0

        for _ in 0..<queue.count {
            let first = queue.removeFirst()
            total += first.val

            if let left = first.left { queue.append(left) }
            if let right = first.right { queue.append(right) }
        }

        if heap.count < k {
            heap.push(total)
        } else if heap.peek()! < total {
            heap.pop()
            heap.push(total)
        }
    }

    if heap.count < k { return -1 }
    return heap.peek()!
}