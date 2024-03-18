// Return true if you can get such expression that evaluates to 24,
// and false otherwise.

func judgePoint24(_ cards: [Int]) -> Bool {
    func calculate(_ a: Double, _ b: Double, _ item: String) -> Double {
        switch item {
        case "+": return a + b
        case "-": return a - b
        case "*": return a * b
        case "/": return a / b
        default: return 0
        }
    }

    let operators = ["+", "-", "*", "/"]

    func backtrack(_ nums: [Double]) -> Bool {
        if nums.count == 1 { return abs(nums[0] - 24) < 1e-6 }

        for i in 0..<nums.count {
            for j in 0..<nums.count {
                if i != j {
                    var next = [Double]()

                    for k in 0..<nums.count {
                        if k != i, k != j { next.append(nums[k]) }
                    }

                    for item in operators {
                        if (item == "+" || item == "*"), i > j { continue }
                        if item == "/", nums[j] == 0 { continue }

                        next.append(calculate(nums[i], nums[j], item))
                        if backtrack(next) { return true }
                        next.removeLast()
                    }
                }
            }
        }
        
        return false
    }

    return backtrack(cards.map { Double($0) })
}

print(judgePoint24([4,1,8,7]))
print(judgePoint24([1,2,1,2]))