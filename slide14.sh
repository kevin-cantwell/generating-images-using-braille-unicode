vcenter <<EOF | bat -l go -p -n
package draw // import "image/draw"

// FloydSteinberg is a Drawer that is the Src Op with Floyd-Steinberg error
// diffusion.
var FloydSteinberg Drawer = floydSteinberg{}
EOF
