// Design an algorithm that collects daily price quotes for some stock and 
// returns the span of that stock's price for the current day.

class StockSpanner {

    private var prices: [(price: Int, span: Int)]

    init() {
        self.prices = []
    }

    func next(_ price: Int) -> Int {
        var span = 1

        while let last = prices.last, last.price <= price {
            let popped = prices.removeLast()
            span += popped.span
        }
        
        prices.append((price: price, span: span))
        return span
    }
}