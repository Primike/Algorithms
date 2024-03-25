class FreqStack {

    var frequency: [Int: Int]
    var stacks: [Int: [Int]]
    var largest: Int

    init() {
        frequency = [:]
        stacks = [:]
        largest = 0
    }

    func push(_ x: Int) {
        frequency[x, default: 0] += 1

        if let count = frequency[x], count > largest { largest = count }

        stacks[frequency[x]!, default: []].append(x)
    }

    func pop() -> Int {
        guard let x = stacks[largest]?.popLast() else { return 0 }

        frequency[x, default: 1] -= 1

        if stacks[largest]?.isEmpty == true { largest -= 1 }
        
        return x
    }
}