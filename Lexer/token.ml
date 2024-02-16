type myBool = True | False
;;

type t = 
| Illegal of string
(* Identifiers *)
| Ident of string
| Integers of int
| Bool of myBool
(* Arith Operators *)
| Assign
| Plus
| Minus
| Asterisk
| Percentage
| Slash
(* Bool Operators *)
| Or
| And
| Not
(* Comparison Operators *)
| Bang
| LessThan
| GreaterThan
| GreaterThanEqual
| LessThanEqual
| Equal
| NotEqual
(* Delimiter *)
| Comma
| InvertedComma
| DoubleInvertedComma
| Semicolon
| Colon
| LeftBracket
| RightBracket
| RightSquare
| LeftSquare
| LeftCurly
| RightCurly
| Dot
(* Keywords *)
| Function
| Let
| If
| Else
| Return
(* For Comments *)
| Hashtags
| NewLine
(* EOF *)
| EOF
;;
