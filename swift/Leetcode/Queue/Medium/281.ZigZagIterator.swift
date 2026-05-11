class ZigzagIterator {
    private var vectors: [[Int]]
    private var queue: [(Int, Int)] = []

    init(_ v1: [Int], _ v2: [Int]) {
        self.vectors = [v1, v2]
        for (index, vector) in vectors.enumerated() {
            if !vector.isEmpty {
                queue.append((index, 0))
            }
        }
    }

    func next() -> Int {
        let (vecIndex, elemIndex) = queue.removeFirst()
        
        if elemIndex + 1 < vectors[vecIndex].count {
            queue.append((vecIndex, elemIndex + 1))
        }
        
        return vectors[vecIndex][elemIndex]
    }

    func hasNext() -> Bool {
        return !queue.isEmpty
    }
}