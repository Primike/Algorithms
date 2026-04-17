class Solution {
    func decodeCiphertext(_ encodedText: String, _ rows: Int) -> String {
        let n = encodedText.count
        if rows == 1 {
            return encodedText
        }

        let cols = n / rows
        let chars = Array(encodedText)
        var res = ""

        for c in 0..<cols {
            var r = 0
            var j = c
            while r < rows && j < cols {
                let index = r * cols + j
                res.append(chars[index])
                r += 1
                j += 1
            }
        }

        while res.last == " " {
            res.removeLast()
        }

        return res
    }
}