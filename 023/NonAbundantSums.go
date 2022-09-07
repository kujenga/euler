package main

import (
	"fmt"
)

var abundancy = make(map[int]bool)

func properDevisorSum(x int) (sum int) {
	for i := 1; i <= x/2; i++ {
		if x%i == 0 {
			sum += i
		}
	}
	return
}

func isAbundant(x int) bool {
    b, ok := abundancy[x]
    if ok {
        return b
    }
    if properDevisorSum(x) > x {
        abundancy[x] = true
    } else {
        abundancy[x] = false
    }
    return abundancy[x]
}

func nonAbundantSum(max int) int {
    sum := 0
    for i := 0; i <= max; i++ {
        abundantSum := false
        for j := 1; j <= i/2; j++ {
            b1 := isAbundant(j)
            b2 := isAbundant(i-j)

            if b1 && b2 {
                abundantSum = true
                break
            }
        }
        if abundantSum == false {
            sum += i
        }
    }
    return sum
}

func main() {
	fmt.Println("sum: ",nonAbundantSum(28123))
}
