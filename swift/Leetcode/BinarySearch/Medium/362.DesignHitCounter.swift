class HitCounter {

    private var hits: [(Int, Int)]
    private var total: Int

    init() {
        self.hits = []
        self.total = 0
    }
    
    func hit(_ timestamp: Int) {
        if let last = hits.last, last.0 == timestamp {
            hits[hits.count - 1].1 += 1
        } else {
            hits.append((timestamp, total + 1))
        }

        total += 1
    }
    func getHits(_ timestamp: Int) -> Int {
        if hits.isEmpty { return 0 }

        var left = 0, right = hits.count - 1
        let threshold = timestamp - 300

        while left < right {
            let mid = (right + left) / 2

            if hits[mid].0 > threshold {
                right = mid
            } else {
                left = mid + 1
            }
        }

        if hits[left].0 <= threshold { return 0 }

        return total - (left > 0 ? hits[left - 1].1 : 0)
    }
}