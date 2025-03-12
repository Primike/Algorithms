// You are given a 0-indexed string s and a 0-indexed 
// integer array spaces that describes the indices in the 
// original string where spaces will be added. 
// Each space should be inserted before the character at the given index.
// For example, given s = "EnjoyYourCoffee" and spaces = [5, 9], 
// we place spaces before 'Y' and 'C', which are at 
// indices 5 and 9 respectively. Thus, we obtain "Enjoy Your Coffee".
// Return the modified string after the spaces have been added.

func addSpaces(_ s: String, _ spaces: [Int]) -> String {
    let s = Array(s)
    var result = ""
    var j = 0

    for (i, letter) in s.enumerated() {
        if j < spaces.count, i == spaces[j] { 
            result += " "
            j += 1
        }
        
        result += String(letter)
    }

    return result
}

print(addSpaces("LeetcodeHelpsMeLearn", [8,13,15]))
print(addSpaces("icodeinpython", [1,5,7,9]))
print(addSpaces("spacing", [0,1,2,3,4,5,6]))