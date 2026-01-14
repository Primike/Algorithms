import Foundation

class SegmentTree {
    private var xs: [Int]
    var n: Int
    private var count: [Int]
    private var covered: [Int]

    init(_ xs: [Int]) {
        self.xs = xs
        self.n = xs.count - 1
        self.count = Array(repeating: 0, count: 4 * n)
        self.covered = Array(repeating: 0, count: 4 * n)
    }

    func update(qleft: Int, qright: Int, qval: Int, left: Int, right: Int, pos: Int) {
        if xs[right + 1] <= qleft || xs[left] >= qright {
            return
        }
        if qleft <= xs[left] && xs[right + 1] <= qright {
            count[pos] += qval
        } else {
            let mid = (left + right) / 2
            update(qleft: qleft, qright: qright, qval: qval, left: left, right: mid, pos: pos * 2 + 1)
            update(qleft: qleft, qright: qright, qval: qval, left: mid + 1, right: right, pos: pos * 2 + 2)
        }

        if count[pos] > 0 {
            covered[pos] = xs[right + 1] - xs[left]
        } else {
            if left == right {
                covered[pos] = 0
            } else {
                covered[pos] = covered[pos * 2 + 1] + covered[pos * 2 + 2]
            }
        }
    }

    func query() -> Int {
        return covered[0]
    }
}

class Solution {
    func separateSquares(_ squares: [[Int]]) -> Double {
        var events: [(y: Int, delta: Int, xl: Int, xr: Int)] = []
        var xsSet = Set<Int>()
        
        for sq in squares {
            let x = sq[0], y = sq[1], l = sq[2]
            events.append((y, 1, x, x + l))
            events.append((y + l, -1, x, x + l))
            xsSet.insert(x)
            xsSet.insert(x + l)
        }
        
        let xs = xsSet.sorted()
        let segTree = SegmentTree(xs)
        events.sort { $0.y < $1.y }

        var psum: [Double] = []
        var widths: [Double] = []
        var totalArea: Double = 0.0
        var prevY = events[0].y

        for event in events {
            let length = Double(segTree.query())
            totalArea += length * Double(event.y - prevY)
            segTree.update(qleft: event.xl, qright: event.xr, qval: event.delta, left: 0, right: segTree.n - 1, pos: 0)
            
            psum.append(totalArea)
            widths.append(Double(segTree.query()))
            prevY = event.y
        }

        let target = totalArea / 2.0
        
        var left = 0
        var right = psum.count - 1
        var i = 0
        
        while left <= right {
            let mid = (left + right) / 2
            if psum[mid] >= target {
                i = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        i -= 1
        let area = i >= 0 ? psum[i] : 0.0
        let width = i >= 0 ? widths[i] : Double(SegmentTree(xs).query()) // Initial width
        let height = Double(events[max(0, i)].y)

        if i < 0 {
            let initialWidth = widths[0]
            return Double(events[0].y) + (target / widths[0])
        }

        return Double(events[i].y) + (target - area) / width
    }
}