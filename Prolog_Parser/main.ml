open Interpreter
open Lexer
open Parser

let parse_file filename =
  let input_channel = open_in filename in
  let lexbuf = Lexing.from_channel input_channel in
  try
    let result = Parser.program Lexer.token lexbuf in
    close_in input_channel;
    result
  with
  | Parsing.Parse_error ->
      close_in input_channel;
      failwith "Syntax error"

let () =
  if Array.length Sys.argv <> 2 then
    Printf.printf "Usage: %s <input_file>\n" Sys.argv.(0)
  else
    let filename = Sys.argv.(1) in
    let ast = parse_file filename in
    Interpreter.print_program ast