struct LazyTag {
    var toAdd: Int = 0

    mutating func add(_ other: LazyTag) {
        toAdd += other.toAdd
    }

    func hasTag() -> Bool {
        return toAdd != 0
    }

    mutating func clear() {
        toAdd = 0
    }
}

struct SegmentTreeNode {
    var minValue: Int = 0
    var maxValue: Int = 0
    var lazyTag: LazyTag = LazyTag()
}

class SegmentTree {
    private var n: Int
    private var tree: [SegmentTreeNode]

    init(data: [Int]) {
        self.n = data.count
        self.tree = Array(repeating: SegmentTreeNode(), count: n * 4 + 1)
        if n > 0 {
            build(data, 1, n, 1)
        }
    }

    func add(l: Int, r: Int, val: Int) {
        if l > r { return }
        var tag = LazyTag()
        tag.toAdd = val
        update(l, r, tag, 1, n, 1)
    }

    func findLast(start: Int, val: Int) -> Int {
        let actualStart = max(1, start)
        if actualStart > n { return -1 }
        return find(actualStart, n, val, 1, n, 1)
    }

    private func applyTag(_ i: Int, _ tag: LazyTag) {
        tree[i].minValue += tag.toAdd
        tree[i].maxValue += tag.toAdd
        tree[i].lazyTag.add(tag)
    }

    private func pushDown(_ i: Int) {
        if tree[i].lazyTag.hasTag() {
            let tag = tree[i].lazyTag
            applyTag(i << 1, tag)
            applyTag((i << 1) | 1, tag)
            tree[i].lazyTag.clear()
        }
    }

    private func pushUp(_ i: Int) {
        tree[i].minValue = min(tree[i << 1].minValue, tree[(i << 1) | 1].minValue)
        tree[i].maxValue = max(tree[i << 1].maxValue, tree[(i << 1) | 1].maxValue)
    }

    private func build(_ data: [Int], _ l: Int, _ r: Int, _ i: Int) {
        if l == r {
            tree[i].minValue = data[l - 1]
            tree[i].maxValue = data[l - 1]
            return
        }
        let mid = l + ((r - l) >> 1)
        build(data, l, mid, i << 1)
        build(data, mid + 1, r, (i << 1) | 1)
        pushUp(i)
    }

    private func update(_ targetL: Int, _ targetR: Int, _ tag: LazyTag, _ l: Int, _ r: Int, _ i: Int) {
        if targetL <= l && r <= targetR {
            applyTag(i, tag)
            return
        }
        pushDown(i)
        let mid = l + ((r - l) >> 1)
        if targetL <= mid {
            update(targetL, targetR, tag, l, mid, i << 1)
        }
        if targetR > mid {
            update(targetL, targetR, tag, mid + 1, r, (i << 1) | 1)
        }
        pushUp(i)
    }

    private func find(_ targetL: Int, _ targetR: Int, _ val: Int, _ l: Int, _ r: Int, _ i: Int) -> Int {
        if tree[i].minValue > val || tree[i].maxValue < val {
            return -1
        }
        if l == r {
            return l
        }
        pushDown(i)
        let mid = l + ((r - l) >> 1)
        if targetR >= mid + 1 {
            let res = find(targetL, targetR, val, mid + 1, r, (i << 1) | 1)
            if res != -1 {
                return res
            }
        }
        if l <= targetR && mid >= targetL {
            return find(targetL, targetR, val, l, mid, i << 1)
        }
        return -1
    }
}

class Solution {
    func longestBalanced(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 0 { return 0 }
        
        var occurrences: [Int: [Int]] = [:]
        
        func sgn(_ x: Int) -> Int {
            return x % 2 == 0 ? 1 : -1
        }

        var prefixSum = Array(repeating: 0, count: n)
        prefixSum[0] = sgn(nums[0])
        occurrences[nums[0], default: []].append(1)

        for i in 1..<n {
            prefixSum[i] = prefixSum[i - 1]
            if occurrences[nums[i]]?.isEmpty ?? true {
                prefixSum[i] += sgn(nums[i])
            }
            occurrences[nums[i], default: []].append(i + 1)
        }

        let seg = SegmentTree(data: prefixSum)
        var maxLength = 0

        for i in 0..<n {
            let lastPos = seg.findLast(start: i + maxLength, val: 0)
            if lastPos != -1 {
                maxLength = max(maxLength, lastPos - i)
            }

            var nextPos = n + 1
            if var occ = occurrences[nums[i]], !occ.isEmpty {
                occ.removeFirst()
                occurrences[nums[i]] = occ
                if let first = occ.first {
                    nextPos = first
                }
            }

            seg.add(l: i + 1, r: nextPos - 1, val: -sgn(nums[i]))
        }

        return maxLength
    }
}