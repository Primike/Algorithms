func parseBoolExpr(_ expression: String) -> Bool {
    var expr = Array(expression)
    
    while expr.count > 1 {
        let start = max(expr.lastIndex(of: "!") ?? -1,
                        expr.lastIndex(of: "&") ?? -1,
                        expr.lastIndex(of: "|") ?? -1)
        
        let end = expr[start...].firstIndex(of: ")") ?? -1
        let subExpr = Array(expr[start...end])
        let op = subExpr[0]
        let values = subExpr[2..<subExpr.count-1]

        let result: Character

        switch op {
        case "!":
            result = values.contains("t") ? "f" : "t"
        case "&":
            result = values.contains("f") ? "f" : "t"
        case "|":
            result = values.contains("t") ? "t" : "f"
        default:
            result = "f"
        }
        
        expr.replaceSubrange(start...end, with: [result])
    }
    
    return expr == ["t"]
}

print(parseBoolExpr("&(|(f))"))
print(parseBoolExpr("|(f,f,f,t)"))
print(parseBoolExpr("!(&(f,t))"))