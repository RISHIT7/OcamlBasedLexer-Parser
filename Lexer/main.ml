open Printf
open Token

let get_token_list lexbuf =
  let rec work acc =
    match Lexer.token lexbuf with
    | EOF -> acc
    | t -> work (t::acc)
  in List.rev (work [])

let tokens_matching = function
  | Plus -> "plus"
  | Percentage -> "percentage"
  | Minus -> "minus"
  | Asterisk -> "asterisk"
  | Hashtags -> "hashtag"
  | NewLine -> "newline"
  | Slash -> "slash"
  | Integers(i) -> sprintf "%d : int" i
  | Bool(True) -> "true : bool"
  | Bool(False) -> "false : bool"
  | Assign -> "assign"
  | Or -> "or"
  | And -> "and"
  | Not -> "not"
  | Bang -> "bang"
  | LessThan -> "lessthan"
  | GreaterThan -> "greaterthan"
  | GreaterThanEqual -> "greaterthanequal"
  | LessThanEqual -> "lessthanequal"
  | Equal -> "equal"
  | NotEqual -> "notequal"
  | Comma -> "comma"
  | InvertedComma -> "invertedcomma"
  | DoubleInvertedComma -> "doubleinvertedcomma"
  | Colon -> "colon"
  | Semicolon -> "semicolon"
  | LeftBracket -> "leftbracket"
  | RightBracket -> "rightbracket"
  | LeftCurly -> "leftcurly"
  | RightCurly -> "rightcurly"
  | RightSquare -> "rightsquare"
  | LeftSquare -> "leftsquare"
  | Function -> "function"
  | Let -> "let"
  | If -> "if"
  | Else -> "else"
  | Return -> "return"
  | Dot -> "dot"
  | EOF -> "eof"
  | Ident(i) -> sprintf "%s : identifier" i
  | Illegal(i) -> sprintf "%s : error" i
;;

let lexer strings =
  let lexbuf = Lexing.from_string strings in
  let token_list = get_token_list lexbuf in
  List.map tokens_matching token_list |> List.iter (printf "%s\n")
;;

let read_file path = 
  let in_channel = open_in path in
  try
    while true do
      let line = input_line in_channel in
        lexer line
    done
  with End_of_file -> 
    close_in in_channel
  ;;

let main = 
  let f = "Test/" ^ Sys.argv.(1) ^  ".txt" in
  read_file f
;;

