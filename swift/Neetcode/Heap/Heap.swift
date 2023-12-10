struct Heap<T: Comparable> {
    enum HeapType {
        case maxHeap
        case minHeap
    }

    var items: [T] = []
    let type: HeapType
    
    init(type: HeapType) {
        self.type = type
    }

    init(array: [T], type: HeapType) {
        self.type = type
        for item in array {
            push(item)
        }
    }

    var isEmpty: Bool {
        return items.isEmpty
    }

    var count: Int {
        return items.count
    }

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
        var index = items.count - 1
        while index > 0 && compare(items[(index - 1) / 2], items[index]) {
            items.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }

    mutating func pop() -> T? {
        guard !items.isEmpty else { return nil }
        let topValue = items[0]
        items[0] = items.last!
        items.removeLast()
        var index = 0
        while 2 * index + 1 < items.count {
            var selectedChildIndex = 2 * index + 1
            if 2 * index + 2 < items.count && compare(items[2 * index + 1], items[2 * index + 2]) {
                selectedChildIndex = 2 * index + 2
            }
            if !compare(items[index], items[selectedChildIndex]) {
                break
            }
            items.swapAt(index, selectedChildIndex)
            index = selectedChildIndex
        }
        return topValue
    }
}