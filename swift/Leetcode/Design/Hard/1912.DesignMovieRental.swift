struct ShopMovie: Hashable {
    let shop: Int
    let movie: Int
}

class MovieRentingSystem {

    private var available: [ShopMovie: Int] = [:]
    private var movieShops: [Int: [(price: Int, shop: Int)]] = [:]
    private var rented: Set<ShopMovie> = []

    init(_ n: Int, _ entries: [[Int]]) {
        for entry in entries {
            let shop = entry[0]
            let movie = entry[1]
            let price = entry[2]
            
            let key = ShopMovie(shop: shop, movie: movie)
            available[key] = price
            movieShops[movie, default: []].append((price, shop))
        }
        
        for movie in movieShops.keys {
            movieShops[movie]?.sort { ($0.price, $0.shop) < ($1.price, $1.shop) }
        }
    }
    
    func search(_ movie: Int) -> [Int] {
        var result: [Int] = []
        let shops = movieShops[movie, default: []]
        
        for (price, shop) in shops {
            let key = ShopMovie(shop: shop, movie: movie)
            if !rented.contains(key) {
                result.append(shop)
            }
            if result.count == 5 {
                break
            }
        }
        return result
    }
    
    func rent(_ shop: Int, _ movie: Int) {
        let key = ShopMovie(shop: shop, movie: movie)
        rented.insert(key)
    }
    
    func drop(_ shop: Int, _ movie: Int) {
        let key = ShopMovie(shop: shop, movie: movie)
        rented.remove(key)
    }
    
    func report() -> [[Int]] {
        var rentedList: [(price: Int, shop: Int, movie: Int)] = []
        
        for key in rented {
            if let price = available[key] {
                rentedList.append((price, key.shop, key.movie))
            }
        }
        
        rentedList.sort { ($0.price, $0.shop, $0.movie) < ($1.price, $1.shop, $1.movie) }
        
        let top5 = rentedList.prefix(5)
        
        return top5.map { [$0.shop, $0.movie] }
    }
}