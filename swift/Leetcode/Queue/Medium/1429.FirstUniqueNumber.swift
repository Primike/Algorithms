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