class Solution {
    func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
        var queue = [Int]()
        dfs(root, &queue, k, target)
        return queue
    }

    func dfs(_ node: TreeNode?, _ queue: inout [Int], _ k: Int, _ target: Double) {
        guard let node = node else {
            return
        }

        dfs(node.left, &queue, k, target)

        queue.append(node.val)
        
        if queue.count > k {
            guard let firstVal = queue.first, let lastVal = queue.last else { return }
            
            let firstDiff = abs(target - Double(firstVal))
            let lastDiff = abs(target - Double(lastVal))

            if firstDiff <= lastDiff {
                queue.removeLast()
                return
            } else {
                queue.removeFirst()
            }
        }

        dfs(node.right, &queue, k, target)
    }
}