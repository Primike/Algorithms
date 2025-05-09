func calculate(_ s: String) -> Int {
    let s = Array(s + "+")
    var lastOperation: Character = "+"
    var result = 0
    var current = 0
    var last = 0

    for i in 0..<s.count {
        if s[i] == " " { continue }

        if s[i].isNumber {
            current = current * 10 + Int(String(s[i]))!
            continue
        } else if lastOperation == "+" {
            result += last
            last = current
        } else if lastOperation == "-" {
            result += last
            last = -current
        } else if lastOperation == "*" {
            last *= current
        } else if lastOperation == "/" {
            last /= current
        }

        lastOperation = s[i]
        current = 0
    }

    result += last 
    return result
}