// Return a list of lists of the suggested products after each character of searchWord is typed.

//Try two pointers
func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
    let products = products.sorted()
    var result = [[String]]()
    var current = ""

    for letter in searchWord {
        current += String(letter)
        
        var left = 0, right = products.count

        while left < right {
            let mid = (left + right) / 2

            if products[mid] < current {
                left = mid + 1
            } else {
                right = mid
            }
        }

        var start = left
        var words = [String]()
        var i = start

        while i < products.count, words.count < 3, products[i].hasPrefix(current) {
            words.append(products[i])
            i += 1
        }

        result.append(words)
    }

    return result
}

print(searchWord(["mobile","mouse","moneypot","monitor","mousepad"], "mouse"))
print(searchWord(["havana"], "havana"))