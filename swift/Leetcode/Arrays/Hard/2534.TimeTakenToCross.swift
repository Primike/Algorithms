// There are n persons numbered from 0 to n - 1 and a door. 
// Each person can enter or exit through the door once, taking one second.
// If the door was not used in the previous second, 
// then the person who wants to exit goes first.
// Return an array answer of size n where answer[i] is the 
// second at which the ith person crosses the door.

// Time: O(n), Space: O(n)
func timeTaken(_ arrival: [Int], _ state: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: arrival.count)
    var enterQueue = [Int]()
    var exitQueue = [Int]()
    var i = 0, j = 0, k = 0
    var time = arrival[0]
    var enterLast = false
    
    while i < arrival.count || j < enterQueue.count || k < exitQueue.count {
        if j == enterQueue.count, k == exitQueue.count {
            if i < arrival.count { time = arrival[i] }
            enterLast = false
        }
        
        while i < arrival.count, time >= arrival[i] {
            if state[i] == 0 { enterQueue.append(i) }
            if state[i] == 1 { exitQueue.append(i) }
            i += 1
        }
        
        if enterLast {
            while j < enterQueue.count {
                result[enterQueue[j]] = time
                time += 1
                j += 1

                while i < arrival.count, time >= arrival[i] {
                    if state[i] == 0 { enterQueue.append(i) }
                    if state[i] == 1 { exitQueue.append(i) }
                    i += 1
                }
            }

            while k < exitQueue.count {
                result[exitQueue[k]] = time
                time += 1
                k += 1
                
                while i < arrival.count, time >= arrival[i] {
                    if state[i] == 0 { enterQueue.append(i) }
                    if state[i] == 1 { exitQueue.append(i) }
                    i += 1
                }
            }

            enterLast = true
        } else {
            while k < exitQueue.count {
                result[exitQueue[k]] = time
                time += 1
                k += 1

                while i < arrival.count, time >= arrival[i] {
                    if state[i] == 0 { enterQueue.append(i) }
                    if state[i] == 1 { exitQueue.append(i) }
                    i += 1
                }
            }

            while j < enterQueue.count {
                result[enterQueue[j]] = time
                time += 1
                j += 1

                while i < arrival.count, time >= arrival[i] {
                    if state[i] == 0 { enterQueue.append(i) }
                    if state[i] == 1 { exitQueue.append(i) }
                    i += 1
                }
            }

            enterLast = false
        }
    }
    
    return result
}

print(timeTaken([0,1,1,2,4], [0,1,0,0,1]))
print(timeTaken([0,0,0], [1,0,1]))