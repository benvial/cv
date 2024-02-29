all: pdf clean

allfrench: french clean


cl: letter clean
	

letter:
	xelatex cover_letter.tex
	biber cover_letter
	xelatex cover_letter.tex



pdf:
	xelatex CV_BVIAL.tex
	biber CV_BVIAL
	xelatex CV_BVIAL.tex


french:
	xelatex CV_BVIAL_fr.tex
	biber CV_BVIAL_fr
	xelatex CV_BVIAL_fr.tex

clean:
	find . \( -name "*.fls" -o -name "*.out" -o -name "*.log" -o -name "*.xdv" -o -name "*.bbl" -o -name "*.blg" -o -name "*.fdb_latexmk" -o -name "*.synctex.gz" -o -name "*.bak" -o -name "*.aux" -o -name "*.xml" -o -name "*.bcf" \) -exec rm {} \;
