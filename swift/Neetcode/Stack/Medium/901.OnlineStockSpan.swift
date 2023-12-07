// Design an algorithm that collects daily price quotes for some stock and 
// returns the span of that stock's price for the current day.

class StockSpanner {

    private var prices: [(Int, Int)]

    init() {
        prices = []
    }
    
    func next(_ price: Int) -> Int {
        var days = 1

        while let last = prices.last, price >= last.0 {
            days += last.1
            prices.removeLast()
        }

        prices.append((price, days))
        return days
    }
}
