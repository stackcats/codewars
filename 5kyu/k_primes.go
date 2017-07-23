package kata

func factor(n int) int {
	ct := 0
	i := 2
	for i*i <= n {
		for n%i == 0 {
			ct++
			n /= i
		}
		i++
	}
	if n > 1 {
		ct++
	}
	return ct
}

func CountKprimes(k, start, nd int) []int {
	var arr []int
	for i := start; i <= nd; i++ {
		if k == factor(i) {
			arr = append(arr, i)
		}
	}
	return arr
}

func Puzzle(s int) int {
	p1 := CountKprimes(1, 0, s)
	p3 := CountKprimes(3, 0, s)
	p7 := CountKprimes(7, 0, s)

	ct := 0
	for _, x1 := range p1 {
		for _, x3 := range p3 {
			for _, x7 := range p7 {
				if x1+x3+x7 == s {
					ct++
				}
			}
		}
	}
	return ct
}
