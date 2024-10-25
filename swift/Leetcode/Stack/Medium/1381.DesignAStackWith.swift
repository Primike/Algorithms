class CustomStack {

    private let maxSize: Int
    private var stack: [Int]

    init(_ maxSize: Int) {
        self.maxSize = maxSize
        self.stack = []
    }
    
    func push(_ x: Int) {
        if stack.count == maxSize { return }
        stack.append(x)
    }
    
    func pop() -> Int {
        if stack.isEmpty { return -1 }
        return stack.removeLast()
    }
    
    func increment(_ k: Int, _ val: Int) {
        for i in 0..<min(stack.count, k) {
            stack[i] += val
        }
    }
}