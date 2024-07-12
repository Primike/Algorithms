// Divide the corridor into non-overlapping sections, 
// where each section has exactly two seats with any number of plants. 
// There may be multiple ways to perform the division. 
// Two ways are different if there is a position with a 
// room divider installed in the first way but not in the second way.
// Return the number of ways to divide the corridor. 

func numberOfWays(_ corridor: String) -> Int {
    let mod = 1_000_000_007
    let seats = corridor.filter { $0 == "S" }.count
    
    if seats == 0 || seats % 2 != 0 { return 0 }

    var result = 1
    var count = 0
    var previous = -1

    for (i, char) in corridor.enumerated() {
        if char == "P" { continue }

        count += 1

        if count > 2, count % 2 == 1 { result = (result * (i - previous)) % mod }
        
        previous = i
    }

    return result
}

print(numberOfWays("SSPPSPS"))
print(numberOfWays("PPSPSP"))
print(numberOfWays("S"))


func numberOfWays2(_ corridor: String) -> Int {
    let seatCount = corridor.filter { $0 == "S" }.count
    if seatCount % 2 != 0 || seatCount == 0 { return 0 }

    let mod = 1_000_000_007
    let corridor = Array(corridor).map { String($0) }
    var memo = [String: Int]()
    
    func dp(_ i: Int, _ seats: Int) -> Int {
        let key = "\(i),\(seats)"

        if i == corridor.count { return seats == 2 ? 1 : 0 }
        if let value = memo[key] { return value }

        var result = 0

        if seats == 2 {
            if corridor[i] == "S" {
                result += dp(i + 1, 1) % mod
            } else {
                result += (dp(i + 1, 0) + dp(i + 1, 2)) % mod
            }
        } else {
            if corridor[i] == "S" {
                result += dp(i + 1, seats + 1) % mod
            } else {
                result += dp(i + 1, seats) % mod
            }
        }

        memo[key] = result
        return result
    }

    return dp(0, 0)
}

// TLE
func numberOfWays3(_ corridor: String) -> Int {
    let seats = corridor.filter { $0 == "S" }.count
    if seats % 2 != 0 || seats == 0 { return 0 }

    let mod = 1_000_000_007
    let corridor = Array(corridor).map { String($0) }
    var tab = Array(repeating: 0, count: corridor.count + 1)
    tab[0] = 1

    for i in 1..<tab.count {
        var j = i - 1
        var count = 0

        while j >= 0, (count <= 2 || count == 2 && corridor[j] != "S") {
            if corridor[j] == "S" { count += 1 }
            if count == 2 { tab[i] += (tab[j] % mod) }
            j -= 1 
        }
    }

    return tab[tab.count - 1] % mod
}