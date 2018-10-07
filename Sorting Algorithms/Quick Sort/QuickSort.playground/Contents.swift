extension Array where Element: Comparable {
    mutating func quickSort() {
        shuffle()
        quickSort(lo: 0, hi: count - 1)
    }

    mutating private func quickSort(lo: Int, hi: Int) {
        guard lo < hi else { return }
        let pivot = partition(lo, hi)
        quickSort(lo: lo, hi: pivot)
        quickSort(lo: pivot + 1, hi: hi)
    }

    mutating private func partition(_ lo: Int, _ hi: Int) -> Int {
        let pivot = self[lo]
        var left = lo - 1
        var right = hi + 1

        while true {
            repeat { left += 1 } while self[left] < pivot
            repeat { right -= 1 } while self[right] > pivot

            guard left < right else { return right }

            swapAt(left, right)
        }
    }

    mutating func quickSort3Way() {
        quickSort3Way(lo: 0, hi: count - 1)
    }

    mutating private func quickSort3Way(lo: Int, hi: Int) {
        guard lo < hi else { return }

        let pivot = self[lo]
        var left = lo
        var right = hi
        var i = lo + 1

        while i <= right {
            let value = self[i]

            if value < pivot {
                swapAt(i, left)
                left += 1
                i += 1
            } else if value > pivot {
                swapAt(i, right)
                right -= 1
            } else {
                i += 1
            }
        }

        quickSort(lo: lo, hi: i - 1)
        quickSort(lo: right, hi: hi)
    }
}

var array = (0...100).shuffled()
array.quickSort()

array = (0...100).shuffled()
array.quickSort3Way()
