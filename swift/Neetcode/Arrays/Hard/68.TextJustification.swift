// Given an array of strings words and a width maxWidth, format the text such that 
// each line has exactly maxWidth characters and is fully (left and right) justified.

func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
    var result = [String]()
    var lines = [([String], Int)]()
    var i = 0

    while i < words.count {
        var line = [words[i]]
        var count = words[i].count
        i += 1

        while i < words.count, count + words[i].count + line.count <= maxWidth {
            line.append(words[i])
            count += words[i].count
            i += 1
        }

        lines.append((line, count))
    }

    for i in 0..<(lines.count - 1) {
        var (line, count) = lines[i]
        
        if line.count == 1 {
            result.append(line[0] + String(repeating: " ", count: maxWidth - count))
            continue
        }

        var string = line[0]
        var spaces = maxWidth - count

        for i in 1..<line.count {
            let space = Int(ceil(Double(spaces) / Double(line.count - i)))
            string += String(repeating: " ", count: space)
            string += line[i]
            spaces -= space
        }

        result.append(string)
    }

    var (line, count) = lines[lines.count - 1]
    var string = ""
    var spaces = 0

    for word in line {
        string += word

        if spaces + count < maxWidth { 
            string += " " 
            spaces += 1
        }
    }

    string += String(repeating: " ", count:  maxWidth - count - spaces)
    result.append(string)

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