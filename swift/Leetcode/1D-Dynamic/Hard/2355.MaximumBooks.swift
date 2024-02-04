// You are going to take books from a contiguous section of the 
// bookshelf spanning from l to r where 0 <= l <= r < n. 
// For each index i in the range l <= i < r, you must take 
// strictly fewer books from shelf i than shelf i + 1.
// Return the maximum number of books you can take from the bookshelf.

func maximumBooks(_ books: [Int]) -> Int {
    var tab = Array(repeating: 0, count: books.count)
    var stack = [Int]()

    func arithmetic(_ l: Int, _ r: Int) -> Int {
        let count = min(books[r], r - l + 1)
        return ((2 * books[r]) - count + 1) * count / 2
    }

    for (i, book) in books.enumerated() {
        while let index = stack.last, books[index] - index >= book - i {
            stack.removeLast()
        }

        if stack.isEmpty {
            tab[i] = arithmetic(0, i)
        } else {
            let j = stack.last!
            tab[i] = tab[j] + arithmetic(j + 1, i)
        }

        stack.append(i)
    }

    return tab.max() ?? 0
}

print(maximumBooks([8,5,2,7,9]))
print(maximumBooks([7,0,3,4,5]))
print(maximumBooks([8,2,3,7,3,4,0,1,4,3])