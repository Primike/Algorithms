// For an integer array nums, an inverse pair is a pair of integers [i, j] 
// where 0 <= i < j < nums.length and nums[i] > nums[j].
// Given two integers n and k, return the number of different 
// arrays consisting of numbers from 1 to n such that there are 
// exactly k inverse pairs. Since the answer can be huge, return it modulo 109 + 7.

func kInversePairs(_ n: Int, _ k: Int) -> Int {
    let mod = 1_000_000_007
    var tab = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
    tab[0][0] = 1

    for i in 1...n {
        for j in 0...k {
            var value = 0

            for k in 0...min(i - 1, j) {
                value = (value + tab[i - 1][j - k]) % mod
            }

            tab[i][j] = value
        }
    }

    return tab[n][k]
}

print(kInversePairs(3, 0))
print(kInversePairs(3, 1))