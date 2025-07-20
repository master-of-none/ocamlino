.PHONY: test force-test watch clean build

test:
	dune runtest

force-test:
	dune runtest --force

watch:
	dune runtest --watch

clean:
	dune clean

build:
	dune build