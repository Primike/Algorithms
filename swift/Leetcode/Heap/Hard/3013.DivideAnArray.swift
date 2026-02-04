class Container {
    var k: Int
    var st1: Heap<Int>
    var st2: Heap<Int>
    var sm: Int = 0
    
    var count1: Int = 0
    var count2: Int = 0
    var deleted1 = [Int: Int]()
    var deleted2 = [Int: Int]()

    init(k: Int) {
        self.k = k
        self.st1 = Heap<Int>(.maxHeap)
        self.st2 = Heap<Int>(.minHeap)
    }

    private func normalize1() {
        while let top = st1.peek(), let count = deleted1[top], count > 0 {
            deleted1[top] = count - 1
            _ = st1.pop()
        }
    }

    private func normalize2() {
        while let top = st2.peek(), let count = deleted2[top], count > 0 {
            deleted2[top] = count - 1
            _ = st2.pop()
        }
    }

    func adjust() {
        while count1 < k && count2 > 0 {
            normalize2()
            if let x = st2.pop() {
                st1.push(x)
                sm += x
                count1 += 1
                count2 -= 1
            }
            normalize2()
        }

        while count1 > k {
            normalize1()
            if let x = st1.pop() {
                st2.push(x)
                sm -= x
                count1 -= 1
                count2 += 1
            }
            normalize1()
        }
    }

    func add(_ x: Int) {
        normalize2()
        if let top2 = st2.peek(), x >= top2 {
            st2.push(x)
            count2 += 1
        } else {
            st1.push(x)
            sm += x
            count1 += 1
        }
        adjust()
    }

    func erase(_ x: Int) {
        normalize1()
        if let top1 = st1.peek(), x <= top1 {
            deleted1[x, default: 0] += 1
            sm -= x
            count1 -= 1
        } else {
            deleted2[x, default: 0] += 1
            count2 -= 1
        }
        adjust()
    }

    func sum() -> Int {
        return sm
    }
}

class Solution {
    func minimumCost(_ nums: [Int], _ k: Int, _ dist: Int) -> Int {
        let n = nums.count
        let container = Container(k: k - 2)
        
        for i in 1..<(k - 1) {
            container.add(nums[i])
        }

        var ans = container.sum() + nums[k - 1]
        
        for i in k..<n {
            let j = i - dist - 1
            if j > 0 {
                container.erase(nums[j])
            }
            container.add(nums[i - 1])
            ans = min(ans, container.sum() + nums[i])
        }

        return ans + nums[0]
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
        items[0] = items.last!
        items.removeLast()
        var i = 0

        while 2 * i + 1 < items.count {
            var index = 2 * i + 1

            if index + 1 < items.count, compare(items[index], items[index + 1]) {
                index += 1
            }

            if !compare(items[i], items[index]) { break }
            items.swapAt(i, index)
            i = index
        }

        return first
    }
}