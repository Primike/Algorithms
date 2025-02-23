// Design a queue-like data structure that moves the most 
// recently used element to the end of the queue.
// Implement the MRUQueue class:
// MRUQueue(int n) constructs the MRUQueue with n elements: [1,2,3,...,n].
// int fetch(int k) moves the kth element (1-indexed) 
// to the end of the queue and returns it.

// Time: O(n), Space: O(n)
class MRUQueue {

    private var queue: [Int]

    init(_ n: Int) {
        self.queue = Array(1...n)
    }
    
    func fetch(_ k: Int) -> Int {
        let value = queue.remove(at: k - 1)
        queue.append(value)

        return value
    }
}