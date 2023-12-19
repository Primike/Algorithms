// Given an array of strings words and a width maxWidth, format the text such that 
// each line has exactly maxWidth characters and is fully (left and right) justified.

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    var lines = [[String]]()
    var i = 0

    while i < words.count {
        var line = [String]()
        var count = 0

        while i < words.count, count + words[i].count <= maxWidth {
            line.append(words[i])
            count += words[i].count + 1
            i += 1
        }

        lines.append(line)
    }

    var result = [String]()

    for i in 0..<lines.count - 1 {
        var string = ""
        var spaces = maxWidth - lines[i].reduce(0) { $0 + $1.count }

        for j in 0..<lines[i].count - 1 {
            string += lines[i][j]
            var space = spaces % (lines[i].count - j - 1) == 0 ? 0 : 1
            space += spaces / (lines[i].count - j - 1)
            spaces -= space
            string += String(repeating: " ", count: space)
        }

        string += lines[i][lines[i].count - 1]
        if spaces > 0 { string += String(repeating: " ", count: spaces) }
        result.append(string)
    }

    var last = ""

    for word in lines[lines.count - 1] {
        last += word

        if maxWidth > last.count { last += " " }  
    }

    last += String(repeating: " ", count: maxWidth - last.count)
    result.append(last)
    return result
}

print(fullJustify([
    "This", "is", "an", 
    "example", "of", "text", 
    "justification."], 16))
print(fullJustify([
    "What","must","be",
    "acknowledgment",
    "shall","be"], 16))
print(fullJustify([
    "Science","is","what","we",
    "understand","well",
    "enough","to","explain","to",
    "a","computer.","Art","is",
    "everything","else","we",
    "do"], 20))