// You are going to take books from a contiguous section of the 
// bookshelf spanning from l to r where 0 <= l <= r < n. 
// For each index i in the range l <= i < r, you must take 
// strictly fewer books from shelf i than shelf i + 1.
// Return the maximum number of books you can take from the bookshelf.

// Time: O(n), Space: O(n)
func maximumBooks(_ books: [Int]) -> Int {
    func arithmetic(_ l: Int, _ r: Int) -> Int {
        let length = min(books[r], r - l + 1)
        let totalBooks = ((2 * books[r] + 1 - length) * length) / 2
        return totalBooks
    }

    var tab = Array(repeating: 0, count: books.count)
    var monotomic = [Int]()

    for i in 0..<books.count {
        while let j = monotomic.last, books[j] - j >= books[i] - i {
            monotomic.removeLast()
        }

        if monotomic.isEmpty {
            tab[i] = arithmetic(0, i)
        } else {
            let j = monotomic.last!
            tab[i] = arithmetic(j + 1, i) + tab[j]
        }

        monotomic.append(i)
    }

    return tab.max() ?? 0
}

print(maximumBooks([8,5,2,7,9]))
print(maximumBooks([7,0,3,4,5]))
print(maximumBooks([8,2,3,7,3,4,0,1,4,3]))