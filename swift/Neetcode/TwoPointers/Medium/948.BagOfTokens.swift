// Your goal is to maximize the total score by strategically 
// playing these tokens. In one move, you can play an unplayed token 
// in one of the two ways (but not both for the same token):
// Face-up: If your current power is at least tokens[i], you may play tokeni, 
// losing tokens[i] power and gaining 1 score.
// Face-down: If your current score is at least 1, you may play tokeni, 
// gaining tokens[i] power and losing 1 score.
// Return the maximum possible score you can achieve after playing any number of tokens.

// Time: O(n * logn), Space: O(1)
func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
    let tokens = tokens.sorted()
    var left = 0, right = tokens.count - 1
    var result = 0
    var power = power, score = 0

    while left <= right {
        if power >= tokens[left] {
            power -= tokens[left]
            score += 1
            left += 1
        } else if score > 0 {
            power += tokens[right]
            score -= 1
            right -= 1
        } else {
            return result
        }

        result = max(result, score)
    }

    return result
}

print(bagOfTokensScore([100], 50))
print(bagOfTokensScore([200,100], 150))
print(bagOfTokensScore([100,200,300,400], 200))