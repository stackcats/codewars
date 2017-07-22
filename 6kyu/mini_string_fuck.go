package kata

func Interpreter(code string) string {
	var n byte
	var bs []byte
	for _, c := range code {
		if c == '+' {
			n++
		} else if c == '.' {
			bs = append(bs, n)
		}
	}
	return string(bs)
}
