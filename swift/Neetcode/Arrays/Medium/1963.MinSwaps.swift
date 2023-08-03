//You are given a 0-indexed string s of even length n. 
//The string consists of exactly n / 2 opening brackets '[' and n / 2 closing brackets ']'
//Return the minimum number of swaps to make s balanced.

func minSwaps(_ s: String) -> Int {
    var result = 0
    var opened = 0

    for bracket in s {
        if bracket == "]" {
            opened += 1
        } else {
            opened -= 1
        }

        result = max(result, opened)
    }

    return (result + 1) / 2
}

print(minSwaps("][]["))
print(minSwaps("]]][[["))
print(minSwaps("[]"))