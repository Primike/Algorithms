// Given a string formula representing a chemical formula, return the count of each atom.
// For example, "H2O" and "H2O2" are possible, but "H1O2" is impossible.
// Return the count of all elements as a string in the following form: 
// the first name (in sorted order), followed by its count 
// (if that count is more than 1), followed by the second name (in sorted order), 
// followed by its count (if that count is more than 1), and so on.

// Time: O(n^2), Space: O(n)
func countOfAtoms(_ formula: String) -> String {
    let formula = Array(formula)
    var atoms = [String: Int]()
    var multiplier = 1
    var stack = [Int]()
    var i = formula.count - 1

    while i >= 0 {
        var digits = ""

        while formula[i].isNumber {
            digits = String(formula[i]) + digits
            i -= 1
        }

        var element = ""

        while formula[i].isLowercase {
            element = String(formula[i]) + element
            i -= 1
        }

        element = String(formula[i]) + element

        if element == ")" { 
            let number = Int(digits) ?? 1
            multiplier *= number
            stack.append(number)
        } else if element == "(" {
            let last = stack.removeLast()
            multiplier /= last
        } else {
            let number = Int(digits) ?? 1
            atoms[element, default: 0] += multiplier * number
        }

        i -= 1
    }

    var result = ""

    for (element, count) in atoms.sorted(by: { $0.key < $1.key }) {
        result += element + (count > 1 ? String(count) : "")
    }

    return result
}

print(countOfAtoms("H2O"))
print(countOfAtoms("Mg(OH)2"))
print(countOfAtoms("K4(ON(SO3)2)2"))