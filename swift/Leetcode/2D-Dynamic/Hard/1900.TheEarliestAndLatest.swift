class Solution {
    private var F: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 30), count: 30), count: 30)
    private var G: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 30), count: 30), count: 30)

    private func dp(_ n: Int, _ f: Int, _ s: Int) -> (Int, Int) {
        if F[n][f][s] != 0 {
            return (F[n][f][s], G[n][f][s])
        }
        
        if f + s == n + 1 {
            return (1, 1)
        }

        if f + s > n + 1 {
            let result = dp(n, n + 1 - s, n + 1 - f)
            F[n][f][s] = result.0
            G[n][f][s] = result.1
            return result
        }

        var earliest = Int.max
        var latest = Int.min
        let n_half = (n + 1) / 2

        if s <= n_half {
            for i in 0..<f {
                for j in 0..<(s - f) {
                    let (x, y) = dp(n_half, i + 1, i + j + 2)
                    earliest = min(earliest, x)
                    latest = max(latest, y)
                }
            }
        } else {
            let s_prime = n + 1 - s
            let mid = (n - 2 * s_prime + 1) / 2
            for i in 0..<f {
                for j in 0..<(s_prime - f) {
                    let (x, y) = dp(n_half, i + 1, i + j + mid + 2)
                    earliest = min(earliest, x)
                    latest = max(latest, y)
                }
            }
        }
        
        F[n][f][s] = earliest + 1
        G[n][f][s] = latest + 1
        return (F[n][f][s], G[n][f][s])
    }

    func earliestAndLatest(_ n: Int, _ firstPlayer: Int, _ secondPlayer: Int) -> [Int] {
        F = Array(repeating: Array(repeating: Array(repeating: 0, count: 30), count: 30), count: 30)
        G = Array(repeating: Array(repeating: Array(repeating: 0, count: 30), count: 30), count: 30)

        var fp = firstPlayer
        var sp = secondPlayer

        if fp > sp {
            swap(&fp, &sp)
        }

        let (earliest, latest) = dp(n, fp, sp)
        return [earliest, latest]
    }
}