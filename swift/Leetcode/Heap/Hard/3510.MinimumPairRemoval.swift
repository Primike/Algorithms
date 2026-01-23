class Node {
    var value: Int
    var left: Int
    var prev: Node?
    var next: Node?

    init(value: Int, left: Int) {
        self.value = value
        self.left = left
    }
}

struct PQItem: Comparable {
    let first: Node
    let second: Node
    let cost: Int

    static func < (lhs: PQItem, rhs: PQItem) -> Bool {
        if lhs.cost == rhs.cost {
            return lhs.first.left < rhs.first.left
        }
        return lhs.cost < rhs.cost
    }

    static func == (lhs: PQItem, rhs: PQItem) -> Bool {
        return lhs.cost == rhs.cost && lhs.first === rhs.first && lhs.second === rhs.second
    }
}

struct Heap<T: Comparable> {
    enum HeapType {
        case maxHeap
        case minHeap
    }

    let type: HeapType
    var items: [T] = []
    
    init(_ type: HeapType) {
        self.type = type
    }

    init(_ type: HeapType, _ array: [T]) {
        self.type = type
        for item in array {
            push(item)
        }
    }

    var isEmpty: Bool { return items.isEmpty }
    var count: Int { return items.count }

    func peek() -> T? { 
        return items.first 
    }

    private func compare(_ a: T, _ b: T) -> Bool {
        switch type {
        case .minHeap:
            return a > b
        case .maxHeap:
            return a < b
        }
    }

    mutating func push(_ item: T) {
        items.append(item)
        var i = items.count - 1

        while i > 0, compare(items[(i - 1) / 2], items[i]) {
            items.swapAt((i - 1) / 2, i)
            i = (i - 1) / 2
        }
    }

    mutating func pop() -> T? {
        guard !items.isEmpty else { return nil }

        let first = items[0]
        if items.count == 1 {
            items.removeLast()
            return first
        }
        
        items[0] = items.last!
        items.removeLast()
        var i = 0

        while 2 * i + 1 < items.count {
            var index = 2 * i + 1

            if index + 1 < items.count, compare(items[index], items[index + 1]) {
                index += 1
            }

            if !compare(items[i], index < items.count ? items[index] : items[i]) { break }
            items.swapAt(i, index)
            i = index
        }

        return first
    }
}

class Solution {
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        var pq = Heap<PQItem>(.minHeap)
        let head = Node(value: nums[0], left: 0)
        var current = head
        var merged = Array(repeating: false, count: nums.count)
        var decreaseCount = 0
        var count = 0

        for i in 1..<nums.count {
            let newNode = Node(value: nums[i], left: i)
            current.next = newNode
            newNode.prev = current
            pq.push(PQItem(first: current, second: newNode, cost: current.value + newNode.value))

            if nums[i - 1] > nums[i] {
                decreaseCount += 1
            }
            current = newNode
        }

        while decreaseCount > 0, let item = pq.pop() {
            let first = item.first
            let second = item.second
            let cost = item.cost

            if merged[first.left] || merged[second.left] || first.value + second.value != cost {
                continue
            }
            
            count += 1

            if first.value > second.value {
                decreaseCount -= 1
            }

            let prevNode = first.prev
            let nextNode = second.next
            
            first.next = nextNode
            if let nextNode = nextNode {
                nextNode.prev = first
            }

            if let prevNode = prevNode {
                if prevNode.value > first.value && prevNode.value <= cost {
                    decreaseCount -= 1
                } else if prevNode.value <= first.value && prevNode.value > cost {
                    decreaseCount += 1
                }
                pq.push(PQItem(first: prevNode, second: first, cost: prevNode.value + cost))
            }

            if let nextNode = nextNode {
                if second.value > nextNode.value && cost <= nextNode.value {
                    decreaseCount -= 1
                } else if second.value <= nextNode.value && cost > nextNode.value {
                    decreaseCount += 1
                }
                pq.push(PQItem(first: first, second: nextNode, cost: cost + nextNode.value))
            }

            first.value = cost
            merged[second.left] = true
        }

        return count
    }
}