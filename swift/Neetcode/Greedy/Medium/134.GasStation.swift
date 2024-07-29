// Given two integer arrays gas and cost, return the starting gas station's 
// index if you can travel around the circuit once in the clockwise direction, 
// otherwise return -1. If there exists a solution, it is guaranteed to be unique

// Time: O(n), Space: O(1)
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    if gas.reduce(0, +) < cost.reduce(0, +) { return -1 }

    var result = 0, total = 0 

    for i in 0..<gas.count {
        total += gas[i] - cost[i]

        if total < 0 {
            total = 0
            result = i + 1
        }
    }

    return result
}

print(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]))
print(canCompleteCircuit([2,3,4], [3,4,3]))


func canCompleteCircuit2(_ gas: [Int], _ cost: [Int]) -> Int {
    var route = zip(gas, cost).map { ($0.0, $0.1) } + zip(gas, cost).map { ($0.0, $0.1) }
    var currentGas = 0
    var left = 0

    for i in 0..<route.count {   
        currentGas += route[i].0 - route[i].1
                        
        if i - left + 1 == gas.count {
            if currentGas >= 0 { return left % gas.count }

            currentGas -= route[left].0 - route[left].1
            left += 1
        } else if currentGas < 0 {
            left = i + 1
            currentGas = 0
        }
    }

    return -1
}