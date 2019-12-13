vcenter <<EOF | bat -l go -p -n
package dotmatrix // import "github.com/kevin-cantwell/dotmatrix"

// Rune maps each point in braille to a dot identifier and
// calculates the corresponding unicode symbol.
//   +------+
//   |(1)(4)|
//   |(2)(5)|
//   |(3)(6)|
//   |(7)(8)|
//   +------+
// See https://en.wikipedia.org/wiki/Braille_Patterns#Identifying.2C_naming_and_ordering)
func (b Braille) Rune() rune {
	lowEndian := [8]int{b[0][0], b[0][1], b[0][2], b[1][0], b[1][1], b[1][2], b[0][3], b[1][3]}
	var v int
	for i, x := range lowEndian {
		v += int(x) << uint(i)
	}
	return rune(v) + '\u2800'
}
EOF