//Design a stack that supports push, pop, top, 
//and retrieving the minimum element in constant time.

class MinStack {
    private var stack = [Int]()
    private var stackMin = [Int]()
    
    func push(_ val: Int) {
        stack.append(val)

        var currentMin = min(val, stackMin.last ?? val)
        stackMin.append(currentMin)
    }
    
    func pop() {
        stack.removeLast()
        stackMin.removeLast()
    }
    
    func top() -> Int {
        return stack.last ?? 0
    }
    
    func getMin() -> Int {
        return stackMin.last ?? 0
    }
}
