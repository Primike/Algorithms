class Solution {
    func minArea(_ image: [[Character]], _ x: Int, _ y: Int) -> Int {
        guard let firstRow = image.first, !firstRow.isEmpty else {
            return 0
        }
        let m = image.count
        let n = firstRow.count

        let left = searchColumns(image, 0, y, 0, m, true)
        let right = searchColumns(image, y + 1, n, 0, m, false)
        let top = searchRows(image, 0, x, left, right, true)
        let bottom = searchRows(image, x + 1, m, left, right, false)

        guard left < right, top < bottom else {
             return 0
        }

        return (right - left) * (bottom - top)
    }

    private func searchColumns(_ image: [[Character]], _ low: Int, _ high: Int, _ top: Int, _ bottom: Int, _ findFirst: Bool) -> Int {
        var i = low
        var j = high
        while i < j {
            var k = top
            let mid = i + (j - i) / 2
            while k < bottom && image[k][mid] == "0" {
                k += 1
            }
            let hasBlack = k < bottom
            if hasBlack == findFirst {
                j = mid
            } else {
                i = mid + 1
            }
        }
        return i
    }

    private func searchRows(_ image: [[Character]], _ low: Int, _ high: Int, _ left: Int, _ right: Int, _ findFirst: Bool) -> Int {
        var i = low
        var j = high
        while i < j {
            var k = left
            let mid = i + (j - i) / 2
            while k < right && image[mid][k] == "0" {
                k += 1
            }
            let hasBlack = k < right
            if hasBlack == findFirst {
                j = mid
            } else {
                i = mid + 1
            }
        }
        return i
    }
}