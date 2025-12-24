// A square triple (a,b,c) is a triple where a, b, 
// and c are integers and a2 + b2 = c2.
// Given an integer n, return the number of square triples 
// such that 1 <= a, b, c <= n.

// Time: O(n), Space: O(1)
func countTriples(_ n: Int) -> Int {
    var result = 0

    for i in 1..<n {
        for j in (i + 1)...n {
            let cSquared = i * i + j * j
            let c = Int(Double(cSquared).squareRoot())

            if c <= n, c * c == cSquared { result += 2 }
        }
    }

    return result
}

print(countTriples(5))
print(countTriples(10))