// A magician has various spells.
// You are given an array power, where each element represents 
// the damage of a spell. Multiple spells can have the same damage value.
// It is a known fact that if a magician decides to cast a spell 
// with a damage of power[i], they cannot cast any spell with 
// a damage of power[i] - 2, power[i] - 1, power[i] + 1, or power[i] + 2.
// Each spell can be cast only once.
// Return the maximum possible total damage that a magician can cast.

// Time: O(n), Space: O(n)
func maximumTotalDamage(_ power: [Int]) -> Int {
    let dict = power.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var powers = [(Int, Int)]()

    for (key, value) in dict {
        powers.append((key, value))
    }

    powers.sort { $0.0 < $1.0 }
    var tab = Array(repeating: 0, count: powers.count)
    tab[0] = powers[0].0 * powers[0].1

    for i in 1..<tab.count {
        var j = i

        while j >= 0, powers[i].0 - 2 <= powers[j].0 {
            j -= 1
        }

        var total = powers[i].0 * powers[i].1
        if j >= 0 { total += tab[j] }

        tab[i] = max(tab[i - 1], total)
    }

    return tab[tab.count - 1]
}

print(maximumTotalDamage([1,1,3,4]))
print(maximumTotalDamage([7,1,6,6]))


func maximumTotalDamage2(_ power: [Int]) -> Int {
    let dict = power.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var powers = [(Int, Int)]()

    for (key, value) in dict {
        powers.append((key, value))
    }

    powers.sort { $0.0 < $1.0 }
    var memo = [Int: Int]()

    func dp(_ index: Int) -> Int {
        if let value = memo[index] { return value }
        if index >= powers.count { return 0 }

        var result = dp(index + 1)
        var i = index

        while i < powers.count, powers[index].0 + 2 >= powers[i].0 {
            i += 1
        }

        result = max(result, dp(i) + powers[index].0 * powers[index].1)
        memo[index] = result
        return result
    }
    
    return dp(0)
}