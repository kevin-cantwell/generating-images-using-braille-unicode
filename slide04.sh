vcenter <<EOF | bat -l go -p -n
package dotmatrix // import "github.com/kevin-cantwell/dotmatrix"

// Braille epresents an 8 dot braille pattern in x,y coordinates space. Eg:
//   +----------+
//   |(0,0)(1,0)|
//   |(0,1)(1,1)|
//   |(0,2)(1,2)|
//   |(0,3)(1,3)|
//   +----------+
type Braille [2][4]int
EOF