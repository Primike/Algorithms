// There exists an infinitely large two-dimensional grid 
// of uncolored unit cells. You are given a positive integer n, 
// indicating that you must do the following routine for n minutes:
// At the first minute, color any arbitrary unit cell blue.
// Every minute thereafter, color blue every 
// uncolored cell that touches a blue cell.
// Below is a pictorial representation of the state 
// of the grid after minutes 1, 2, and 3.

// Time: O(1), Space: O(1)
func coloredCells(_ n: Int) -> Int {
    let totalGridArea = (n * 2 - 1) * (n * 2 - 1)
    let cornerBlanks = (n * (n + 1) / 2) - n
    return totalGridArea - 4 * cornerBlanks
}

print(coloredCells(1))
print(coloredCells(2))