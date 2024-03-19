class HitCounter {

    var hits: [(Int, Int)]

    init() {
        self.hits = []
    }
    
    func hit(_ timestamp: Int) {
        if let last = hits.last, last.0 == timestamp {
            hits[hits.count - 1].1 += 1
        } else {
            let count = (hits.last?.1 ?? 0) + 1
            hits.append((timestamp, count))
        }
    }
    
    func getHits(_ timestamp: Int) -> Int {
        if hits.isEmpty { return 0 }

        var left = 0, right = hits.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if hits[mid].0 <= timestamp - 300 {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        let last = hits.last ?? (0, 0)
        if left >= hits.count || last.0 < timestamp - 300 { return 0 }
        let result = last.1 - (left > 0 ? hits[left - 1].1 : 0)

        return result
    }
}