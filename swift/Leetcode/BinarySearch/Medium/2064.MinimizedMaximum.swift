// You are given an integer n indicating there are n specialty retail stores. 
// There are m product types of varying amounts, which are given as a 
// 0-indexed integer array quantities, where quantities[i] 
// represents the number of products of the ith product type.
// You need to distribute all products to the retail stores following these rules:
// A store can only be given at most one product type but can be given any amount of it.
// After distribution, each store will have been given some 
// number of products (possibly 0). Let x represent the maximum number 
// of products given to any store. You want x to be as small as possible, 
// i.e., you want to minimize the maximum number of products that are given to any store.
// Return the minimum possible x.

// Time: O(n * log(max)), Space: O(1)
func minimizedMaximum(_ n: Int, _ quantities: [Int]) -> Int {
    var left = 1, right = quantities.max() ?? 0

    while left < right {
        let mid = (right + left) / 2
        var stores = 0

        for products in quantities {
            stores += products / mid
            let remainder = products % mid
            if remainder != 0 { stores += 1 }
        }

        if stores > n {
            left = mid + 1
        } else {
            right = mid
        }
    }

    return left
}

print(minimizedMaximum(6, [11,6]))
print(minimizedMaximum(7, [15,10,10]))
print(minimizedMaximum(1, [100000]))