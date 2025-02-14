func stringShift(_ string: String, _ shift: [[Int]]) -> String {
    var str = Array(string)
    for operation in shift {
        let direction = operation[0]
        let amount = operation[1] % str.count
        if direction == 0 {
            str = Array(str[amount...] + str[..<amount])
        } else {
            str = Array(str[(str.count - amount)...] + str[..<(str.count - amount)])
        }
    }
    return String(str)
}