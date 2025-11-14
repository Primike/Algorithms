// Implement the TwoSum class:
// TwoSum() Initializes the TwoSum object, with an empty array initially.
// void add(int number) Adds number to the data structure.
// boolean find(int value) Returns true if there exists any 
// pair of numbers whose sum is equal to value, otherwise, it returns false.

// Time: O(n), Space: O(n)
class TwoSum {

    private var numberDict: [Int: Int]

    init() {
        numberDict = [:]    
    }
    
    func add(_ number: Int) {
        numberDict[number, default: 0] += 1
    }
    
    func find(_ value: Int) -> Bool {
        for (number, count) in numberDict {
            let remainder = value - number

            if remainder == number {
                if count > 1 { return true }
            }  else {
                if numberDict[remainder] != nil { return true }
            }
        }

        return false
    }
}