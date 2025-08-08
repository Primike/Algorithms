class SegTree {
    private var n: Int
    private var seg: [Int]

    init(_ baskets: [Int]) {
        self.n = baskets.count
        let size = 4 * self.n
        self.seg = Array(repeating: 0, count: size)
        if !baskets.isEmpty {
            build(baskets, 1, 0, self.n - 1)
        }
    }

    private func maintain(_ o: Int) {
        seg[o] = max(seg[o * 2], seg[o * 2 + 1])
    }

    private func build(_ a: [Int], _ o: Int, _ l: Int, _ r: Int) {
        if l == r {
            seg[o] = a[l]
            return
        }
        let m = (l + r) / 2
        build(a, o * 2, l, m)
        build(a, o * 2 + 1, m + 1, r)
        maintain(o)
    }

    func findFirstAndUpdate(capacity: Int) -> Int {
        if self.n == 0 {
            return -1
        }
        return _findFirstAndUpdate(1, 0, self.n - 1, capacity)
    }

    private func _findFirstAndUpdate(_ o: Int, _ l: Int, _ r: Int, _ x: Int) -> Int {
        if seg[o] < x {
            return -1
        }
        if l == r {
            seg[o] = -1
            return l
        }

        let m = (l + r) / 2
        var index = -1
        
        if seg[o * 2] >= x {
            index = _findFirstAndUpdate(o * 2, l, m, x)
        }
        
        if index == -1 {
            index = _findFirstAndUpdate(o * 2 + 1, m + 1, r, x)
        }

        maintain(o)
        return index
    }
}


class Solution {
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        let m = baskets.count
        if m == 0 {
            return fruits.count
        }

        let tree = SegTree(baskets)
        var count = 0

        for fruit in fruits {
            if tree.findFirstAndUpdate(capacity: fruit) == -1 {
                count += 1
            }
        }

        return count
    }
}