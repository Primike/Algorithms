// Given an integer array nums, return true if you can partition the array into 
// two subsets such that the sum of the elements in both subsets is equal or false otherwise.

func canPartition(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)

    if sum % 2 != 0 { return false }

    let target = sum / 2
    var tab = Array(repeating: false, count: target + 1)
    tab[0] = true

    for number in nums {
        for i in stride(from: target, through: number, by: -1) {
            if tab[i - number] { tab[i] = tab[i - number] }
        }
    }
    
    return tab[target]
}

print(canPartition([1,5,11,5]))
print(canPartition([1,2,3,5]))


//enumerated caputres old array values so iteration doesnt have to be backwards
func canPartition(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)

    if sum % 2 != 0 { return false }

    let target = sum / 2
    var tab = Array(repeating: false, count: target + 1)
    tab[0] = true

    for number in nums {
        for (i, bool) in tab.enumerated() {
            if bool == false { continue }

            let index = i + number

            if index < tab.count { tab[index] = true }
        }
    }

    return tab[target]
}