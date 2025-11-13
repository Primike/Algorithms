typealias Pair = (Int, Int)

struct SortedList {
    private var list: [Pair] = []

    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }

    var first: Pair? {
        return list.first
    }
    
    var last: Pair? {
        return list.last
    }
    
    private func firstIndex(where predicate: (Pair) -> Bool) -> Int {
        var low = 0
        var high = list.count
        while low < high {
            let mid = (low + high) / 2
            if predicate(list[mid]) {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return low
    }
    
    mutating func add(_ p: Pair) {
        let index = firstIndex(where: { $0 >= p })
        list.insert(p, at: index)
    }
    
    mutating func remove(_ p: Pair) {
        let index = firstIndex(where: { $0 >= p })
        if index < list.count && list[index] == p {
            list.remove(at: index)
        }
    }
}

class Helper {
    var x: Int
    var result: Int
    var large: SortedList
    var small: SortedList
    var occ: [Int: Int]

    init(_ x: Int) {
        self.x = x
        self.result = 0
        self.large = SortedList()
        self.small = SortedList()
        self.occ = [Int: Int]()
    }

    func insert(_ num: Int) {
        let currentOcc = occ[num, default: 0]
        if currentOcc > 0 {
            internalRemove((currentOcc, num))
        }
        occ[num, default: 0] += 1
        internalInsert((occ[num, default: 0], num))
    }

    func remove(_ num: Int) {
        let currentOcc = occ[num, default: 0]
        guard currentOcc > 0 else { return }
        
        internalRemove((currentOcc, num))
        occ[num, default: 0] -= 1
        if occ[num, default: 0] > 0 {
            internalInsert((occ[num, default: 0], num))
        }
    }

    func get() -> Int {
        return result
    }

    func internalInsert(_ p: Pair) {
        let shouldGoToLarge: Bool
        if large.count < x {
            shouldGoToLarge = true
        } else if let first = large.first {
            shouldGoToLarge = p > first
        } else {
            shouldGoToLarge = true
        }

        if shouldGoToLarge {
            result += p.0 * p.1
            large.add(p)
            if large.count > x {
                if let toRemove = large.first {
                    result -= toRemove.0 * toRemove.1
                    large.remove(toRemove)
                    small.add(toRemove)
                }
            }
        } else {
            small.add(p)
        }
    }

    func internalRemove(_ p: Pair) {
        if let first = large.first, p >= first {
            result -= p.0 * p.1
            large.remove(p)
            if !small.isEmpty {
                if let toAdd = small.last {
                    result += toAdd.0 * toAdd.1
                    small.remove(toAdd)
                    large.add(toAdd)
                }
            }
        } else {
            small.remove(p)
        }
    }
}


class Solution {
    func findXSum(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
        let helper = Helper(x)
        var ans = [Int]()

        for i in 0..<nums.count {
            helper.insert(nums[i])
            if i >= k {
                helper.remove(nums[i - k])
            }
            if i >= k - 1 {
                ans.append(helper.get())
            }
        }

        return ans
    }
}