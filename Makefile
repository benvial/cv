

all: clean
	@mkdir -p build
	@cd src && make -s all && make -s clean

cv: clean
	@mkdir -p build
	@cd src && make -s cv && make -s clean

cl: clean
	@mkdir -p build
	@cd src && make -s cl && make -s clean
	
rp: clean
	@mkdir -p build
	@cd src && make -s rp && make -s clean

cvfr: clean
	@mkdir -p build
	@cd src && make -s cvfr && make -s clean


cvshort: clean
	@mkdir -p build
	@cd src && make -s cvshortw && make -s clean


clean:
	@rm -rf build
	@cd src && make -s clean

save: clean
	@git add -A
	@read -p "Enter commit message: " MSG; \
	git commit -a -m "$$MSG"
	@git push origin master
