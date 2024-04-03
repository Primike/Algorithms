// There is one laser beam between any two security devices if both conditions are met:
// The two devices are located on two different rows: r1 and r2, where r1 < r2.
// For each row i where r1 < i < r2, there are no security devices in the ith row.
// Return the total number of laser beams in the bank.

// Time: O(n * m), Space: O(n)
func numberOfBeams(_ bank: [String]) -> Int {
    let lasers = bank.map { Array($0).filter { $0 == "1"}.count }.filter { $0 != 0 }
    var result = 0

    for i in 1..<max(1, lasers.count) {
        result += lasers[i - 1] * lasers[i]
    }

    return result
}

print(numberOfBeams(["011001","000000","010100","001000"]))
print(numberOfBeams(["000","111","000"]))