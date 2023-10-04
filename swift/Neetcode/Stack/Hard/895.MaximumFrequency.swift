class FreqStack {

    var dict: [Int: Int]
    var stack: [(Int, Int)]

    init() {
        self.dict = [Int: Int]()
        self.stack = [(Int, Int)]()
    }
    
    func push(_ val: Int) {
        dict[val, default: 0] += 1
        stack.append((val, dict[val, default: 1]))
    }
    
    func pop() -> Int {
        var maximum = dict.values.max()
        var value = 0

        for i in stride(from: stack.count - 1, to: -1, by: -1) {
            if stack[i].1 == maximum {
                value = stack[i].0
                dict[stack[i].0, default: 1] -= 1
                stack.remove(at: i)
                break
            }
        }

        return value
    }
}