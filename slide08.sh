vcenter <<EOF | bat -l go -p -n
package dotmatrix // import "github.com/kevin-cantwell/dotmatrix"

// Flush renders a monochrome image to the provided writer as a series of 
// Braille Unicode characters
func (BrailleFlusher) Flush(w io.Writer, img image.Image) error {
	bounds := img.Bounds()
	for py := bounds.Min.Y; py < bounds.Max.Y; py += 4 {
		for px := bounds.Min.X; px < bounds.Max.X; px += 2 {
			var b Braille
			// Draw left-right, top-bottom.
			for y := 0; y < 4; y++ {
				for x := 0; x < 2; x++ {
					if px+x >= bounds.Max.X || py+y >= bounds.Max.Y {
						continue
					}
					if img.At(px+x, py+y) == color.Black {
						b[x][y] = 1
					}
				}
			}
			if _, err := fmt.Fprint(w, string(b.Rune())); err != nil {
				return err
			}
		}
		if _, err := fmt.Fprint(w, "\\\n"); err != nil {
			return err
		}
	}
	return nil
}
EOF
