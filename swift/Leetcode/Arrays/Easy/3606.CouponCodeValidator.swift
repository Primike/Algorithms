// A coupon is considered valid if all of the following conditions hold:
// code[i] is non-empty and consists only of alphanumeric characters 
// (a-z, A-Z, 0-9) and underscores (_).
// businessLine[i] is one of the following four categories: 
// "electronics", "grocery", "pharmacy", "restaurant". 
// isActive[i] is true.
// Return an array of the codes of all valid coupons, 
// sorted first by their businessLine in the order: 
// "electronics", "grocery", "pharmacy", "restaurant", 
// and then by code in lexicographical (ascending) order within each category.

// Time: O(n * l * log(n)), Space: O(n * l)
func validateCoupons(_ code: [String], _ businessLine: [String], _ isActive: [Bool]) -> [String] {
    let validBuisness = ["electronics", "grocery", "pharmacy", "restaurant"]
    var coupons = [(String, String)]()

    for i in 0..<code.count {
        if code[i].isEmpty { continue }
        if !code[i].allSatisfy({ $0.isNumber || $0.isLetter || $0 == "_" }) { continue }
        if !validBuisness.contains(businessLine[i]) { continue }
        if !isActive[i] { continue }

        coupons.append((code[i], businessLine[i]))
    }

    return coupons.sorted { c1, c2 in 
        let index1 = validBuisness.firstIndex(of: c1.1) ?? Int.max
        let index2 = validBuisness.firstIndex(of: c2.1) ?? Int.max

        if index1 > index2 { 
            return false
        } else if index1 < index2 {
            return true
        } else {
            return c1 < c2
        }
    }.map { $0.0 }
}

print(validateCoupons(["SAVE20","","PHARMA5","SAVE@20"], ["restaurant","grocery","pharmacy","restaurant"], [true,true,true,true]))
print(validateCoupons(["GROCERY15","ELECTRONICS_50","DISCOUNT10"], ["grocery","electronics","invalid"], [false,true,true]))