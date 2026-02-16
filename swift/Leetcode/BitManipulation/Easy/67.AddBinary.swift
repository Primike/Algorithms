class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let aChars = Array(a)
        let bChars = Array(b)

        var i = aChars.count - 1
        var j = bChars.count - 1
        var carry = 0
        var result: [Character] = []
        result.reserveCapacity(max(aChars.count, bChars.count) + 1)

        while i >= 0 || j >= 0 || carry > 0 {
            var sum = carry

            if i >= 0 {
                sum += (aChars[i] == "1") ? 1 : 0
                i -= 1
            }
            if j >= 0 {
                sum += (bChars[j] == "1") ? 1 : 0
                j -= 1
            }

            result.append((sum % 2 == 1) ? "1" : "0")
            carry = sum / 2
        }

        return String(result.reversed())
    }
}