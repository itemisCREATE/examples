#/bin/sh

base="$1"
pngtopnm "${base}_decl.png" >tmp.1.ppm
pngtopnm "${base}_model.png" >tmp.2.ppm
pnmcat -leftright tmp.1.ppm tmp.2.ppm | pnmtopng -compression 9 >"${base}.png"
rm tmp.1.ppm tmp.2.ppm
