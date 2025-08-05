class CustomStack {

    private let maxSize: Int
    private var stack: [Int]
    private var prefixArray: [Int]

    init(_ maxSize: Int) {
        self.maxSize = maxSize
        self.stack = []
        self.prefixArray = Array(repeating: 0, count: maxSize)
    }
    
    func push(_ x: Int) {
        if stack.count == maxSize { return }
        stack.append(x)
    }
    
    func pop() -> Int {
        if stack.isEmpty { return -1 }

        let i = stack.count - 1
        let result = stack[i] + prefixArray[i]

        if i > 0 { prefixArray[i - 1] += prefixArray[i] }

        prefixArray[i] = 0
        stack.removeLast()
        return result
    }
    
    func increment(_ k: Int, _ val: Int) {
        let count = stack.count
        let i = min(k, count) - 1
        
        if i >= 0 { prefixArray[i] += val }
    }
}