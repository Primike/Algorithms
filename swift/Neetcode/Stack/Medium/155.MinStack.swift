// Design a stack that supports push, pop, top, 
// and retrieving the minimum element in constant time.

class MinStack {
    
    private var stack: [(Int, Int)]

    init() {
        self.stack = []
    }
    
    func push(_ val: Int) {
        if let last = stack.last, val > last.1 {
            stack.append((val, last.1))
        } else {
            stack.append((val, val))
        }
    }
    
    func pop() {
        if !stack.isEmpty { stack.removeLast() }
    }
    
    func top() -> Int {
        return stack.last?.0 ?? 0
    }
    
    func getMin() -> Int {
        return stack.last?.1 ?? 0
    }
}