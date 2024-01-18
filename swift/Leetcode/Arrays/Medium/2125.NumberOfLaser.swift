// There is one laser beam between any two security devices if both conditions are met:
// The two devices are located on two different rows: r1 and r2, where r1 < r2.
// For each row i where r1 < i < r2, there are no security devices in the ith row.
// Return the total number of laser beams in the bank.


// Time: O(n * m), Space: O(n)
func numberOfBeams(_ bank: [String]) -> Int {
    var lasers = [Int]()

    for row in bank {
        var count = 0

        for number in row {
            if number == "1" { count += 1 }
        }

        lasers.append(count)
    }

    var result = 0, last = lasers[0]

    for i in 1..<lasers.count {
        if lasers[i] == 0 { continue }

        result += lasers[i] * last
        last = lasers[i]
    }

    return result
}

print(numberOfBeams(["011001","000000","010100","001000"]))
print(numberOfBeams(["000","111","000"]))