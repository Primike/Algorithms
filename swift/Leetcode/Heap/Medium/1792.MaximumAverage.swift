//  You are given a 2D integer array classes, where classes[i] = [passi, totali]
//  There are another extraStudents brilliant students that are 
//  guaranteed to pass the exam of any class they are assigned to.
//  The pass ratio of a class is equal to the number of students of the class 
//  that will pass the exam divided by the total number of students of the class. 
//  Return the maximum possible average pass ratio after assigning the extraStudents students. 

struct ClassRoom: Comparable {
    let pass: Double
    let taken: Double
    let gain: Double

    static func < (_ l: ClassRoom, _ r: ClassRoom) -> Bool {
        return l.gain < r.gain
    }
}

// Time: O(n * log(n) + e * log(n)), Space: O(n)
func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
    let classes = classes.map { [Double($0[0]), Double($0[1])] }
    var heap = Heap<ClassRoom>(.maxHeap)

    for i in 0..<classes.count {
        let pass = classes[i][0], taken = classes[i][1]
        let gain = (pass + 1) / (taken + 1) - pass / taken
        heap.push(ClassRoom(pass: pass, taken: taken, gain: gain))
    }

    for i in 0..<extraStudents {
        let first = heap.pop()!
        let pass = first.pass + 1, taken = first.taken + 1
        let gain = (pass + 1) / (taken + 1) - pass / taken
        heap.push(ClassRoom(pass: pass, taken: taken, gain: gain))
    }

    var result = 0.0

    for i in 0..<classes.count {
        let first = heap.pop()!
        result += first.pass / first.taken
    }

    return result / Double(classes.count)
}

print(maxAverageRatio([[1,2],[3,5],[2,2]], 2))
print(maxAverageRatio([[2,4],[3,9],[4,5],[2,10]], 4))