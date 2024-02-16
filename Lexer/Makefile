test_file := Test1

all:
	@ocamlbuild main.native
	@ocamlc -o main _build/lexer.cmo _build/main.cmo
	@./main $(test_file)

clean:
	@ocamlbuild -clean
	@rm -f *~ main.native \#* main