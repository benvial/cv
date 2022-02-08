

all: clean
	@mkdir -p build
	@cd src && make -s all && make -s clean
	@mv src/*.pdf ./build


clean:
	@rm -rf build
	@cd src && make -s clean


save: clean
	@git add -A
	@read -p "Enter commit message: " MSG; \
	git commit -a -m "$$MSG"
	@git push origin master
