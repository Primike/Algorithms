// If the student at the front of the queue prefers the sandwich on the top of the stack, 
// they will take it and leave the queue.
// Otherwise, they will leave it and go to the queue's end.
// This continues until none of the queue students want to take the 
// top sandwich and are thus unable to eat.
// Return the number of students that are unable to eat.

// Time: O(n), Space: O(1)
func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
    var dict = students.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var i = 0

    while i < students.count, dict[sandwiches[i], default: 0] > 0 {
        dict[sandwiches[i]]! -= 1
        i += 1
    }

    return students.count - i
}

print(countStudents([1,1,0,0], [0,1,0,1]))
print(countStudents([1,1,1,0,0,1], [1,0,0,0,1,1]))