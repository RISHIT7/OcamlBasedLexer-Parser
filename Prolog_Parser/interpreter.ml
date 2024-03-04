open Printf

type variable = string
type symbol = string
type signature = (symbol * int) list
type term = Variable of variable | Integer of int | Node of symbol * (term list) | Underscore
type atom = Atom of symbol * (term list)
type head = Head of atom
type body = Body of atom list
type clause = Fact of head | Rule of head * body
type program = clause list
type goal = Goal of atom list
type substitution = (variable * term) list

let rec print_term term =
  match term with
  | Variable v -> Printf.printf "Variable: %s\n" v
  | Integer i -> Printf.printf "Integer: %d\n" i
  | Underscore -> Printf.printf "Variable: _\n"
  | Node (s, terms) ->
      Printf.printf "Term: %s{\n" s;
      print_term_list terms;
      Printf.printf "}\n"

and print_term_list terms =
  match terms with
  | [] -> ()
  | [t] -> print_term t
  | t :: rest ->
      print_term t;
      Printf.printf "";
      print_term_list rest
;;

let rec print_atom atom =
  match atom with
  | Atom (s, terms) ->
      Printf.printf "Atom: %s{\n" s;
      print_term_list terms;
      Printf.printf "}\n"

let print_head head =
  match head with
  | Head atom -> print_atom atom

let print_body body =
  match body with
  | Body atoms ->
      List.iter (fun atom -> print_atom atom; Printf.printf "") atoms

let print_clause clause =
  match clause with
  | Fact head ->
      Printf.printf "Fact: \n";
      print_head head
  | Rule (head, body) ->
      Printf.printf "Rule: \n";
      print_head head;
      Printf.printf "Cond\n";
      print_body body

let print_program program =
  List.iter (fun clause -> print_clause clause; Printf.printf "\n") program

let print_goal goal =
  match goal with
  | Goal atoms ->
      List.iter (fun atom -> print_atom atom; Printf.printf "") atoms

let rec print_ast ast =
  match ast with
  | [] -> Printf.printf "Empty AST\n"
  | clause :: rest ->
      print_clause clause;
      Printf.printf "\n";
      print_ast rest