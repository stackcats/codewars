package kata

import (
	"fmt"
	"strings"
)

func Interpreter(code string, iterations, width, height int) string {
	fmt.Println(code)
	grid := make([][]int, height)
	for i := range grid {
		grid[i] = make([]int, width)
	}

	i := 0
	j := 0
	cp := 0
	ip := 0

	for ip < iterations && cp < len(code) {
		switch code[cp] {
		case 'n':
			i = (i - 1 + height) % height
		case 'e':
			j = (j + 1) % width
		case 's':
			i = (i + 1) % height
		case 'w':
			j = (j - 1 + width) % width
		case '*':
			if grid[i][j] == 1 {
				grid[i][j] = 0
			} else {
				grid[i][j] = 1
			}
		case '[':
			if grid[i][j] == 0 {
				ct := 0
				for !(code[cp] == ']' && ct == 1) {
					if code[cp] == ']' {
						ct--
					} else if code[cp] == '[' {
						ct++
					}
					cp++
				}
			}
		case ']':
			if grid[i][j] == 1 {
				ct := 0
				for !(code[cp] == '[' && ct == 1) {
					if code[cp] == ']' {
						ct++
					} else if code[cp] == '[' {
						ct--
					}
					cp--
				}
			}
		default:
			ip--
		}
		cp++
		ip++
	}

	ans := make([]string, height)
	for i, r := range grid {
		for _, c := range r {
			ans[i] += fmt.Sprintf("%d", c)
		}
	}
	return strings.Join(ans, "\r\n")
}
