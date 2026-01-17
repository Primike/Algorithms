class Solution {
    func separateSquares(_ squares: [[Int]]) -> Double {
        var totalArea: Double = 0
        var events: [(y: Double, l: Double, delta: Double)] = []

        for sq in squares {
            let y = Double(sq[1])
            let l = Double(sq[2])
            totalArea += l * l
            events.append((y, l, 1.0))
            events.append((y + l, l, -1.0))
        }

        events.sort { $0.y < $1.y }

        var coveredWidth: Double = 0.0
        var currArea: Double = 0.0
        var prevHeight: Double = events.first?.y ?? 0.0

        for event in events {
            let diff = event.y - prevHeight
            let area = coveredWidth * diff
            
            if 2 * (currArea + area) >= totalArea {
                return prevHeight + (totalArea - 2 * currArea) / (2 * coveredWidth)
            }
            
            coveredWidth += event.delta * event.l
            currArea += area
            prevHeight = event.y
        }

        return 0.0
    }
}