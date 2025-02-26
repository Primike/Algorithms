// At every node i, there is a gate. You are also given an array 
// of even integers amount, where amount[i] represents:
// the price needed to open the gate at node i, if amount[i] is negative, or,
// the cash reward obtained on opening the gate at node i, otherwise.
// The game goes on as follows:
// Initially, Alice is at node 0 and Bob is at node bob.
// At every second, Alice and Bob each move to an adjacent node. 
// Alice moves towards some leaf node, while Bob moves towards node 0.
// For every node along their path, Alice and Bob either spend money 
// to open the gate at that node, or accept the reward. Note that:
// If the gate is already open, no price will be required, 
// nor will there be any cash reward.
// If Alice and Bob reach the node simultaneously, 
// they share the price/reward for opening the gate there. 
// In other words, if the price to open the gate is c, 
// then both Alice and Bob pay c / 2 each. Similarly, 
// if the reward at the gate is c, both of them receive c / 2 each.
// If Alice reaches a leaf node, she stops moving. Similarly, 
// if Bob reaches node 0, he stops moving. 
// Note that these events are independent of each other.
// Return the maximum net income Alice can have 
// if she travels towards the optimal leaf node.

// Time: O(n^2), Space: O(n)
func mostProfitablePath(_ edges: [[Int]], _ bob: Int, _ amount: [Int]) -> Int {
    var neighbors = Array(repeating: [Int](), count: amount.count)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    func dfsBob(_ node: Int, _ parent: Int) -> (Int, [Int], Bool) {
        if node == 0 { return (amount[node], [node], true) }

        var total = Int.min
        var paths = [Int]()
        var reachedZero = false

        for next in neighbors[node] { 
            if next == parent { continue }

            let (sum, nodes, bool) = dfsBob(next, node)
            
            if bool, sum > total {
                total = sum
                paths = nodes
                reachedZero = true
            }
        }

        if !reachedZero { return (amount[node], [node], false) }

        return (total + amount[node], paths + [node], reachedZero)
    }

    var (_, bobPath, _) = dfsBob(bob, -1)
    bobPath = Array(bobPath.reversed())

    func dfsAlice(_ node: Int, _ parent: Int, _ level: Int) -> Int {
        var result = Int.min
        
        for next in neighbors[node] {
            if next == parent { continue }

            result = max(result, dfsAlice(next, node, level + 1))
        }

        if result == Int.min { result = 0 }
        
        if level > 0, level < bobPath.count, bobPath.prefix(level).contains(node) {
            return result
        } else if level < bobPath.count, bobPath[level] == node {
            result += amount[node] / 2 
        } else {
            result += amount[node]
        }

        return result
    }

    return dfsAlice(0, -1, 0)
}

print(mostProfitablePath([[0,1],[1,2],[1,3],[3,4]], 3, [-2,4,2,-4,6]))
print(mostProfitablePath([[0,1]], 1, [-7280,2350]))