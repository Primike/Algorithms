// For example, the sequence arr = [8,8,8,5,5] can be encoded to be 
// encoding = [3,8,2,5]. encoding = [3,8,0,9,2,5] and 
// encoding = [2,8,1,8,2,5] are also valid RLE of arr.
// Given a run-length encoded array, design an iterator that iterates through it.
// Implement the RLEIterator class:
// RLEIterator(int[] encoded) Initializes the object with the encoded array encoded.
// int next(int n) Exhausts the next n elements and returns 
// the last element exhausted in this way. 
// If there is no element left to exhaust, return -1 instead.

// Time: O(log(n)), Space: O(n)
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