// There are n persons numbered from 0 to n - 1 and a door. 
// Each person can enter or exit through the door once, taking one second.
// If the door was not used in the previous second, 
// then the person who wants to exit goes first.
// Return an array answer of size n where answer[i] is the 
// second at which the ith person crosses the door.

// Time: O(n), Space: O(n)
func timeTaken(_ arrival: [Int], _ state: [Int]) -> [Int] {
    var zeros = [Int](), ones = [Int]()

    for i in 0..<arrival.count {
        if state[i] == 0 {
            zeros.append(i)
        } else {
            ones.append(i)
        }
    }

    var result = Array(repeating: -1, count: arrival.count)
    var didEnter = false 
    if !zeros.isEmpty, !ones.isEmpty { didEnter = arrival[ones[0]] > arrival[zeros[0]] }
    var time = 0

    while !zeros.isEmpty, !ones.isEmpty {
        let i = zeros[0], j = ones[0]

        if time < arrival[i], time < arrival[j] {
            time = min(arrival[i], arrival[j])
            didEnter = false
        }

        if arrival[i] > time {
            result[j] = time
            didEnter = false
            ones.removeFirst()
        } else if arrival[j] > time {
            result[i] = time
            didEnter = true
            zeros.removeFirst()
        } else {
            if didEnter {
                result[i] = time
                zeros.removeFirst()
            } else {
                result[j] = time
                ones.removeFirst()
            }
        }

        time += 1
    }

    var nonEmpty = zeros.isEmpty ? ones : zeros

    for i in nonEmpty {
        result[i] = max(time, arrival[i])
        time = max(time, arrival[i]) + 1
    }

    return result
}

print(timeTaken([0,1,1,2,4], [0,1,0,0,1]))
print(timeTaken([0,0,0], [1,0,1]))