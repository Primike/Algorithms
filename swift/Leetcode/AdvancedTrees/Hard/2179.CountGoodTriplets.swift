class FenwickTree {
    var tree: [Int]

    init(size: Int) {
        tree = Array(repeating: 0, count: size + 1)
    }

    func update(index: Int, delta: Int) {
        var mutableIndex = index + 1
        while mutableIndex < tree.count {
            tree[mutableIndex] += delta
            mutableIndex += mutableIndex & -mutableIndex
        }
    }

    func query(index: Int) -> Int {
        var mutableIndex = index + 1
        var res = 0
        while mutableIndex > 0 {
            res += tree[mutableIndex]
            mutableIndex -= mutableIndex & -mutableIndex
        }
        return res
    }
}

struct Solution {
    func goodTriplets(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        guard n >= 3 else { return 0 }

        var pos2 = Array(repeating: 0, count: n)
        for (i, num2) in nums2.enumerated() {
            pos2[num2] = i
        }

        var p = Array(repeating: 0, count: n)
        for (i, num1) in nums1.enumerated() {
            p[pos2[num1]] = i
        }

        let tree = FenwickTree(size: n)
        var res: Int64 = 0

        for value in 0..<n {
            let pos = p[value]

            let leftCount = tree.query(index: pos)
            tree.update(index: pos, delta: 1)

            let left: Int64 = Int64(leftCount)
            let n64 = Int64(n)
            let pos64 = Int64(pos)
            let value64 = Int64(value)

            let totalIndicesGreaterPos = n64 - 1 - pos64
            let processedIndicesGTEPos = value64 - left
            let right: Int64 = totalIndicesGreaterPos - processedIndicesGTEPos

            if right > 0 {
               res += left * right
            }
        }

        return Int(res)
    }
}