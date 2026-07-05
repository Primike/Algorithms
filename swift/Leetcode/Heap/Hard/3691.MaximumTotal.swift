class SegTree {
    private var n: Int
    private var maxv: [Int]
    private var minv: [Int]

    init(nums: [Int]) {
        self.n = nums.count
        self.maxv = Array(repeating: 0, count: 4 * n)
        self.minv = Array(repeating: 0, count: 4 * n)
        build(node: 1, l: 0, r: n - 1, nums: nums)
    }

    private func build(node: Int, l: Int, r: Int, nums: [Int]) {
        if l == r {
            maxv[node] = nums[l]
            minv[node] = nums[l]
            return
        }
        let m = (l + r) / 2
        build(node: node * 2, l: l, r: m, nums: nums)
        build(node: node * 2 + 1, l: m + 1, r: r, nums: nums)
        maxv[node] = max(maxv[node * 2], maxv[node * 2 + 1])
        minv[node] = min(minv[node * 2], minv[node * 2 + 1])
    }

    func queryMax(node: Int, l: Int, r: Int, ql: Int, qr: Int) -> Int {
        if ql <= l && r <= qr { return maxv[node] }
        let m = (l + r) / 2
        var res = Int.min
        if ql <= m { res = max(res, queryMax(node: node * 2, l: l, r: m, ql: ql, qr: qr)) }
        if qr > m { res = max(res, queryMax(node: node * 2 + 1, l: m + 1, r: r, ql: ql, qr: qr)) }
        return res
    }

    func queryMin(node: Int, l: Int, r: Int, ql: Int, qr: Int) -> Int {
        if ql <= l && r <= qr { return minv[node] }
        let m = (l + r) / 2
        var res = Int.max
        if ql <= m { res = min(res, queryMin(node: node * 2, l: l, r: m, ql: ql, qr: qr)) }
        if qr > m { res = min(res, queryMin(node: node * 2 + 1, l: m + 1, r: r, ql: ql, qr: qr)) }
        return res
    }
}

struct HeapNode: Comparable {
    let diff: Int, l: Int, r: Int
    static func < (lhs: HeapNode, rhs: HeapNode) -> Bool { lhs.diff < rhs.diff }
}

class Solution {
    func maxTotalValue(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let seg = SegTree(nums: nums)
        var pq = Heap<HeapNode>(.maxHeap)

        for l in 0..<n {
            let diff = seg.queryMax(node: 1, l: 0, r: n - 1, ql: l, qr: n - 1) - 
                       seg.queryMin(node: 1, l: 0, r: n - 1, ql: l, qr: n - 1)
            pq.push(HeapNode(diff: diff, l: l, r: n - 1))
        }

        var ans = 0
        var remainingK = k
        while remainingK > 0, let top = pq.pop() {
            ans += top.diff
            remainingK -= 1
            if top.r > top.l {
                let newDiff = seg.queryMax(node: 1, l: 0, r: n - 1, ql: top.l, qr: top.r - 1) - 
                              seg.queryMin(node: 1, l: 0, r: n - 1, ql: top.l, qr: top.r - 1)
                pq.push(HeapNode(diff: newDiff, l: top.l, r: top.r - 1))
            }
        }
        return ans
    }
}