// Given a string s containing only digits, return all possible valid IP addresses 
// that can be formed by inserting dots into s. You are not allowed to reorder 
// or remove any digits in s. You may return the valid IP addresses in any order.

func restoreIpAddresses(_ s: String) -> [String] {
    var s = Array(s)
    var result = [String]()

    func backtrack(_ left: Int, _ ip: String, _ dots: Int) {
        if dots == 4, left == s.count {
            var ip = String(ip.dropLast())
            result.append(ip)
            return
        }

        if dots > 4 { return }

        for i in left..<min(left + 3, s.count) {
            let number = String(s[left...i])

            if Int(number)! <= 255 && (i == left || number.first! != "0") {
                backtrack(i + 1, ip + number +  ".", dots + 1)
            }
        }
    }

    backtrack(0, "", 0)
    return result
}

print(restoreIpAddresses("25525511135"))
print(restoreIpAddresses("0000"))
print(restoreIpAddresses("101023"))