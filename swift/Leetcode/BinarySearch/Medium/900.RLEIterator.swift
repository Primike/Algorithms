class RLEIterator {

    private var digitCount: [Int]
    private var digits: [Int]
    private var exhaust: Int
    private var i: Int

    init(_ encoding: [Int]) {
        self.digitCount = []
        self.digits = []
        self.exhaust = 0
        self.i = 0

        var sum = 0

        for i in stride(from: 0, to: encoding.count - 1, by: 2) {
            if encoding[i] == 0 { continue }
            
            sum += encoding[i]
            digitCount.append(sum)
            digits.append(encoding[i + 1])
        }
    }
    
    func next(_ n: Int) -> Int {
        exhaust += n

        var right = digitCount.count - 1

        while i <= right {
            let mid = (right + i) / 2

            if digitCount[mid] < exhaust {
                i = mid + 1
            } else if mid == 0 || digitCount[mid - 1] < exhaust {
                i = mid 
                return digits[i]
            } else {
                right = mid - 1
            }
        }

        return -1
    }
}