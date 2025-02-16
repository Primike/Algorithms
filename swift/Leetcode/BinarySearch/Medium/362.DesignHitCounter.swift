// Design a hit counter which counts the number of hits received 
// in the past 5 minutes (i.e., the past 300 seconds).
// Your system should accept a timestamp parameter (in seconds granularity), 
// and you may assume that calls are being made to the system in 
// chronological order (i.e., timestamp is monotonically increasing). 
// Several hits may arrive roughly at the same time.
// Implement the HitCounter class:
// HitCounter() Initializes the object of the hit counter system.
// void hit(int timestamp) Records a hit that happened at timestamp 
// (in seconds). Several hits may happen at the same timestamp.
// int getHits(int timestamp) Returns the number of hits in the past 
// 5 minutes from timestamp (i.e., the past 300 seconds).

// Time: O(log(n)), Space: O(n)
class HitCounter {

    private var hits: [(Int, Int)]

    init() {
        hits = []
    }
    
    func hit(_ timestamp: Int) {
        var newHit = (timestamp, 1)

        if let last = hits.last {
            if timestamp == last.0 { hits.removeLast() }
            newHit.1 += last.1
        }

        hits.append(newHit)
    }
    
    func getHits(_ timestamp: Int) -> Int {
        let target = timestamp - 300

        guard let last = hits.last, target < last.0 else { return 0 }

        var left = 0, right = hits.count - 1

        while left < right {
            let mid = (right + left) / 2

            if hits[mid].0 > target { 
                right = mid
            } else {
                left = mid + 1
            }
        }

        return last.1 - (left > 0 ? hits[left - 1].1 : 0)
    }
}