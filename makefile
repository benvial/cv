all: pdf clean

pdf:
	xelatex CV_BVIAL.tex
	biber CV_BVIAL
	xelatex CV_BVIAL.tex


clean:
	find . \( -name "*.fls" -o -name "*.out" -o -name "*.log" -o -name "*.xdv" -o -name "*.bbl" -o -name "*.blg" -o -name "*.fdb_latexmk" -o -name "*.synctex.gz" -o -name "*.bak" -o -name "*.aux" -o -name "*.xml" -o -name "*.bcf" \) -exec rm {} \;
