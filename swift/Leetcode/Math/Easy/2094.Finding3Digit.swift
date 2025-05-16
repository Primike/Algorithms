func findEvenNumbers(_ digits: [Int]) -> [Int] {
    var dict = digits.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = [Int]()

    for i in 100...999 {
        if i % 2 != 0 { continue }
        
        let digit1 = i / 100
        let digit2 = (i / 10) % 10
        let digit3 = i % 10
        var dictCopy = dict

        if dictCopy[digit1, default: 0] == 0 { continue }
        dictCopy[digit1]! -= 1
        if dictCopy[digit2, default: 0] == 0 { continue }
        dictCopy[digit2]! -= 1
        if dictCopy[digit3, default: 0] == 0 { continue }
        dictCopy[digit3]! -= 1

        result.append(i)
    }

    return result
}