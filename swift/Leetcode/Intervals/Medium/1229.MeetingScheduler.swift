// Given the availability time slots arrays slots1 and slots2 of 
// two people and a meeting duration duration, return the earliest time slot 
// that works for both of them and is of duration duration.
// If there is no common time slot that satisfies the requirements, 
// return an empty array.
// The format of a time slot is an array of two elements [start, end] 
// representing an inclusive time range from start to end.

// Time: O(n * log(n)), Space: O(1)
func minAvailableDuration(_ slots1: [[Int]], _ slots2: [[Int]], _ duration: Int) -> [Int] {
    let slots1 = slots1.filter { $0[1] - $0[0] >= duration }.sorted { $0[0] < $1[0] }
    let slots2 = slots2.filter { $0[1] - $0[0] >= duration }.sorted { $0[0] < $1[0] }
    var i = 0, j = 0
    
    while i < slots1.count, j < slots2.count {
        let start = max(slots1[i][0], slots2[j][0])
        let end = min(slots1[i][1], slots2[j][1])
        
        if end - start >= duration {
            return [start, start + duration]
        }
        
        if slots1[i][1] < slots2[j][1] {
            i += 1
        } else {
            j += 1
        }
    }
    
    return []
}

print(minAvailableDuration([[10,50],[60,120],[140,210]], [[0,15],[60,70]], 8))
print(minAvailableDuration([[10,50],[60,120],[140,210]], [[0,15],[60,70]], 12))