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