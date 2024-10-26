// You have a queue of integers, you need to retrieve the 
// first unique integer in the queue.
// Implement the FirstUnique class:
// FirstUnique(int[] nums) Initializes the object with the numbers in the queue.
// int showFirstUnique() returns the value of the first unique integer 
// of the queue, and returns -1 if there is no such integer.
// void add(int value) insert value to the queue.

class FirstUnique {
    
    private var queue: [Int]
    private var isUnique: [Int: Bool]
    
    init(_ nums: [Int]) {
        self.queue = nums
        self.isUnique = [:]

        for num in nums {
            self.add(num)
        }
    }
    
    func showFirstUnique() -> Int {
        while !queue.isEmpty, !(isUnique[queue.first!] ?? false) {
            queue.removeFirst()
        }

        return queue.isEmpty ? -1 : queue.first!
    }
    
    func add(_ value: Int) {
        if isUnique[value] == nil {
            isUnique[value] = true
            queue.append(value)
        } else {
            isUnique[value] = false
        }
    }
}