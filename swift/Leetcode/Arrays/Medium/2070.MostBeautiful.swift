// You are given a 2D integer array items where items[i] = [pricei, beautyi] 
// denotes the price and beauty of an item respectively.
// You are also given a 0-indexed integer array queries. For each queries[j], 
// you want to determine the maximum beauty of an item whose price 
// is less than or equal to queries[j]. 
// If no such item exists, then the answer to this query is 0.
// Return an array answer of the same length as queries 
// where answer[j] is the answer to the jth query.

func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: queries.count)
    var sortedItems = items.sorted { $0[0] < $1[0] }
    var queriesWithIndices = queries.enumerated().map { [$0.element, $0.offset] }.sorted { $0[0] < $1[0] }
    var itemIndex = 0
    var maxBeauty = 0

    for i in 0..<queries.count {
        let query = queriesWithIndices[i][0]
        let originalIndex = queriesWithIndices[i][1]

        while itemIndex < sortedItems.count, sortedItems[itemIndex][0] <= query {
            maxBeauty = max(maxBeauty, sortedItems[itemIndex][1])
            itemIndex += 1
        }

        result[originalIndex] = maxBeauty
    }

    return result
}

print(maximumBeauty([[1,2],[3,2],[2,4],[5,6],[3,5]], [1,2,3,4,5,6]))
print(maximumBeauty([[1,2],[1,2],[1,3],[1,4]], [1]))
print(maximumBeauty([[10,1000]], [5]))