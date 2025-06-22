class Solution {
    func maxDistance(_ s: String, _ k: Int) -> Int {
        var latitude = 0
        var longitude = 0
        var ans = 0
        
        for (i, char) in s.enumerated() {
            switch char {
            case "N":
                latitude += 1
            case "S":
                latitude -= 1
            case "E":
                longitude += 1
            case "W":
                longitude -= 1
            default:
                break
            }
            
            ans = max(ans, min(abs(latitude) + abs(longitude) + k * 2, i + 1))
        }
        
        return ans
    }
}