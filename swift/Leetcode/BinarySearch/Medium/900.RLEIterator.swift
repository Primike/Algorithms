class RLEIterator {

    private var numbers: [(Int, Int)]
    private var exhaust: Int
    private var left: Int

    init(_ encoding: [Int]) {
        self.numbers = []
        var total = 0

        for i in stride(from: 0, to: encoding.count - 1, by: 2) {
            if encoding[i] == 0 { continue }
            numbers.append((total + encoding[i], encoding[i + 1]))
            total += encoding[i]
        }

        self.exhaust = 0
        self.left = 0
    }
    
    func next(_ n: Int) -> Int {
        exhaust += n
        var right = numbers.count - 1

        while left < right {
            let mid = (right + left) / 2

            if numbers[mid].0 < exhaust {
                left = mid + 1 
            } else {
                right = mid
            }
        }

        if numbers[left].0 < exhaust { return -1 }
        return numbers[left].1
    }
}