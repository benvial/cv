
.PHONY: clean
	
	
define compile
		@xelatex $(1).tex
		@biber $(1)
		@xelatex $(1).tex
		@make -s clean
endef


define show
	@xdg-open ../build/$(1).pdf
endef

define build
	mkdir -p ../build
	$(call compile,$(1))
	@mv $(1).pdf ../build
	$(call show,$(1))
endef


define watch
	while inotifywait -e close_write $(1).tex; do make $(1); done
endef


all: cv cl rp

cvw:
	$(call watch,cv)
	
clw:
	$(call watch,cl)
	
rpw:
	$(call watch,rp)

cl:
	$(call build,cl)
	
cv:
	$(call build,cv)
	
rp:
	$(call build,rp)
	
cvfr:
	$(call build,cv_fr)
	
cvfrw:
	$(call watch,cv_fr)

clean:
	@find . \( -name "*.fls" -o -name "*.out" -o -name "*.log" -o -name "*.xdv" -o -name "*.bbl" -o -name "*.blg" -o -name "*.fdb_latexmk" -o -name "*.synctex.gz" -o -name "*.bak" -o -name "*.aux" -o -name "*.xml" -o -name "*.bcf" \) -exec rm {} \;


mv:
	@mv *.pdf ../build

bb:
	@betterbib up publications.bib > better.bib
