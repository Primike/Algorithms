func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
    let n = s.count
    var diffArray = [Int](repeating: 0, count: n)
    let chars = Array(s)

    for shift in shifts {
        if shift[2] == 1 {
            diffArray[shift[0]] += 1
            if shift[1] + 1 < n {
                diffArray[shift[1] + 1] -= 1
            }
        } else {
            diffArray[shift[0]] -= 1
            if shift[1] + 1 < n {
                diffArray[shift[1] + 1] += 1
            }
        }
    }

    var result = [Character](repeating: "a", count: n)
    var numberOfShifts = 0

    for i in 0..<n {
        numberOfShifts = (numberOfShifts + diffArray[i]) % 26
        if numberOfShifts < 0 {
            numberOfShifts += 26
        }
        let shiftedChar = Character(UnicodeScalar((Int(chars[i].asciiValue!) - Int(Character("a").asciiValue!) + numberOfShifts) % 26 + Int(Character("a").asciiValue!))!)
        result[i] = shiftedChar
    }

    return String(result)
}