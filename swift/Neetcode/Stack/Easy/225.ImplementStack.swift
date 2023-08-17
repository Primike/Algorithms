// Implement a last-in-first-out (LIFO) stack using only two queues. 
// The implemented stack should support all the functions of a normal stack 
// (push, top, pop, and empty).

class MyStack {
    private var queue: [Int] = []

    func push(_ x: Int) {
        queue.append(x)
    }

    func pop() -> Int {
        for _ in 0..<(queue.count - 1) {
            push(queue.removeFirst())
        }

        return queue.removeFirst()
    }

    func top() -> Int {
        for _ in 0..<(queue.count - 1) {
            push(queue.removeFirst())
        }
        
        let res = queue.first!
        push(queue.removeFirst())
        return res
    }

    func empty() -> Bool {
        return queue.isEmpty
    }
}
