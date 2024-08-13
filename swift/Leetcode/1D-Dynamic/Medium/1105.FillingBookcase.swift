// You are given an array books where books[i] = [thicknessi, heighti] 
// indicates the thickness and height of the ith book. 
// You are also given an integer shelfWidth.
// We want to place these books in order onto bookcase shelves 
// that have a total width shelfWidth.
// For example, if we have an ordered list of 5 books, 
// we might place the first and second book onto the first shelf, 
// the third book on the second shelf, and the fourth and fifth book on the last shelf.
// Return the minimum possible height that the total bookshelf 
// can be after placing shelves in this manner.

// Time: O(n * w), Space: O(n)
func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int) -> Int {
    var tab = Array(repeating: Int.max, count: books.count + 1)
    tab[books.count] = 0
    
    for i in (0..<books.count).reversed() {
        var j = i, width = 0
        var maxHeight = 0

        while j < books.count, width + books[j][0] <= shelfWidth {
            width += books[j][0]
            maxHeight = max(maxHeight, books[j][1])
            tab[i] = min(tab[i], tab[j + 1] + maxHeight)
            j += 1
        }
    }

    return tab[0]
}

print(minHeightShelves([[1,1],[2,3],[2,3],[1,1],[1,1],[1,1],[1,2]], 4))
print(minHeightShelves([[1,3],[2,4],[3,2]], 6))


func minHeightShelves2(_ books: [[Int]], _ shelfWidth: Int) -> Int {
    var memo = [Int: Int]()

    func dp(_ index: Int) -> Int {
        if index == books.count { return 0 }
        if let value = memo[index] { return value }

        var result = Int.max
        var i = index, width = 0
        var maxHeight = 0

        while i < books.count, width + books[i][0] <= shelfWidth {
            width += books[i][0]
            maxHeight = max(maxHeight, books[i][1])
            result = min(result, dp(i + 1) + maxHeight)
            i += 1
        }

        memo[index] = result
        return result
    }

    return dp(0)
}