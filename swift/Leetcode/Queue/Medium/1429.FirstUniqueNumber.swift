// You have a queue of integers, you need to retrieve the 
// first unique integer in the queue.
// Implement the FirstUnique class:
// FirstUnique(int[] nums) Initializes the object with the numbers in the queue.
// int showFirstUnique() returns the value of the first unique integer 
// of the queue, and returns -1 if there is no such integer.
// void add(int value) insert value to the queue.

class FirstUnique {

    private var dict: [Int: Int]
    private var queue: [Int]
    
    init(_ nums: [Int]) {
        self.dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        self.queue = nums
    }
    
    func showFirstUnique() -> Int {
        while let first = queue.first {
            if let value = dict[first], value == 1 { return first }
            queue.removeFirst()
        }

        return -1
    }
    
    func add(_ value: Int) {
        dict[value, default: 0] += 1
        if dict[value]! == 1 { queue.append(value) }
    }
}

class FirstUnique2 {

    private var queue: [Int]
    private var uniqueSet: Set<Int>
    private var duplicateSet: Set<Int>

    init(_ nums: [Int]) {
        self.queue = []
        self.uniqueSet = []
        self.duplicateSet = []

        for number in nums {
            self.add(number)
        }
    }
    
    func showFirstUnique() -> Int {
        while let first = queue.first, !uniqueSet.contains(first) {
            queue.removeFirst()
        }

        return queue.first ?? -1
    }
    
    func add(_ value: Int) {
        if uniqueSet.contains(value) {
            uniqueSet.remove(value)
            duplicateSet.insert(value)
        } else if !duplicateSet.contains(value), !uniqueSet.contains(value) {
            queue.append(value)
            uniqueSet.insert(value)
        }
    }
}