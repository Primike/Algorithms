func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
    var sentence1 = sentence1.split(separator: " ")
    var sentence2 = sentence2.split(separator: " ")
    var start = 0

    if sentence1.count > sentence2.count {
        let temp = sentence1
        sentence1 = sentence2
        sentence2 = temp
    }

    while start < sentence1.count, sentence1[start] == sentence2[start] {
        start += 1
    }

    var i = sentence1.count - 1
    var j = sentence2.count - 1
    
    while i >= 0, sentence1[i] == sentence2[j] {
        i -= 1
        j -= 1
    }

    return i < start
}