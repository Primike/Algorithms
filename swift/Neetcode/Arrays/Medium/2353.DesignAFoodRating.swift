class FoodRatings {

    var cuisineDict = [String: [String: Int]]()
    var foodToCuisine = [String: String]()
    var cuisineHighestRating = [String: (String, Int)]()

    init(_ foods: [String], _ cuisines: [String], _ ratings: [Int]) {
        for i in 0..<foods.count {
            cuisineDict[cuisines[i], default: [:]][foods[i]] = ratings[i]
            foodToCuisine[foods[i]] = cuisines[i]
            updateHighestRated(cuisine: cuisines[i])
        }
    }
    
    func changeRating(_ food: String, _ newRating: Int) {
        guard let cuisine = foodToCuisine[food] else { return }

        cuisineDict[cuisine]?[food] = newRating
        updateHighestRated(cuisine: cuisine)
    }
    
    func highestRated(_ cuisine: String) -> String {
        guard let (food, _) = cuisineHighestRating[cuisine] else { return "" }
        return food
    }

    private func updateHighestRated(cuisine: String) {
        guard let foods = cuisineDict[cuisine] else { return }

        var highestRatedFood = ("", Int.min)

        for (food, rating) in foods {
            if rating > highestRatedFood.1 || (rating == highestRatedFood.1 && food < highestRatedFood.0) {
                highestRatedFood = (food, rating)
            }
        }

        cuisineHighestRating[cuisine] = highestRatedFood
    }
}