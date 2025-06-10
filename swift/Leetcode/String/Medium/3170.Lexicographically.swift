class Solution {
    func clearStars(_ s: String) -> String {
        var cnt = [[Int]](repeating: [], count: 26)
        var arr = Array(s)
        
        let aAscii = Character("a").asciiValue!

        for (i, c) in arr.enumerated() {
            if c != "*" {
                let index = Int(c.asciiValue! - aAscii)
                cnt[index].append(i)
            } else {
                for j in 0..<26 {
                    if !cnt[j].isEmpty {
                        arr[cnt[j].removeLast()] = "*"
                        break
                    }
                }
            }
        }
        
        return String(arr.filter { $0 != "*" })
    }
}