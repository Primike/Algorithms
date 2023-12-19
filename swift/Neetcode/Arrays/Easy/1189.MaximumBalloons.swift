// Given a string text, you want to use the characters of text 
// to form as many instances of the word "balloon" as possible.
// You can use each character in text at most once. 

func maxNumberOfBalloons(_ text: String) -> Int {
    let textDict = NSCountedSet(array: Array(text))
    let balloon = NSCountedSet(array: Array("balloon"))
    
    var result = Int.max

    for letter in balloon {
        result = min(result, textDict.count(for: letter) / balloon.count(for: letter))
    }

    return result
}

print(maxNumberOfBalloons("nlaebolko"))
print(maxNumberOfBalloons("loonbalxballpoon"))
print(maxNumberOfBalloons("leetcode"))