struct Project: Comparable {    
    let cost: Int
    let profit: Int
    var inQueue = false

    static func <(left: Project, right: Project) -> Bool {
        if left.inQueue { return (left.profit, left.cost) < (right.profit, right.cost) }

        return (left.cost, left.profit) < (right.cost, right.profit)
    }
}

// Time: nlog(n), Space: n
func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
    var costHeap = Heap<Project>(type: .minHeap)

    for (profit, cost) in zip(profits, capital) {
        costHeap.push(Project(cost: cost, profit: profit))
    }

    var profitHeap = Heap<Project>(type: .maxHeap)
    var k = k
    var w = w

    while k > 0 {
        while var cheap = costHeap.peek(), cheap.cost <= w {
            cheap.inQueue = true
            profitHeap.push(cheap)
            costHeap.pop()
        }

        if let best = profitHeap.pop() {
            w += best.profit
            k -= 1
        } else {
            k = 0
        }
    }

    return w
}

print(findMaximizedCapital(2, 0, [1,2,3], [0,1,1]))
print(findMaximizedCapital(3, 0, [1,2,3], [0,1,2]))