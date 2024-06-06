// Time: O(1), Space: O(n)
class MyQueue {
    private var stack1: [Int] = []
    private var stack2: [Int] = []
    private var front: Int = 0

    func push(_ x: Int) {
        if stack1.isEmpty { front = x }
        stack1.append(x)
    }

    func pop() -> Int {
        if stack2.isEmpty {
            while !stack1.isEmpty {
                stack2.append(stack1.removeLast())
            }
        }

        return stack2.popLast() ?? -1
    }

    func peek() -> Int {
        if let first = stack2.last { return first }
        return front
    }

    func empty() -> Bool {
        return stack1.isEmpty && stack2.isEmpty
    }
}