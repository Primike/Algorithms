// There are n seats and n students in a room. You are given an array seats 
// of length n, where seats[i] is the position of the ith seat. 
// You are also given the array students of length n, where students[j] 
// is the position of the jth student.
// You may perform the following move any number of times:
// Increase or decrease the position of the ith student by 1 
// (i.e., moving the ith student from position x to x + 1 or x - 1)
// Return the minimum number of moves required to move each student 
// to a seat such that no two students are in the same seat.

// Time: O(n * log(n)), Space: O(n)
func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
    var seats = seats.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var standing = [Int]()

    for student in students {
        if let value = seats[student] {
            seats[student] = value - 1
            if value == 1 { seats[student] = nil }
        } else {
            standing.append(student)
        }
    }

    let openSeats = seats.flatMap { Array(repeating: $0.key, count: $0.value) }.sorted()
    standing.sort()

    return zip(openSeats, standing).map { abs($0.0 - $0.1) }.reduce(0, +)
}

print(minMovesToSeat([3,1,5], [2,7,4]))
print(minMovesToSeat([4,1,5,9], [1,3,2,6]))
print(minMovesToSeat([2,2,6,6], [1,3,2,6]))