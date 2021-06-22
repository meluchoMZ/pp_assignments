(* Miguel Blanco Godón Grupo 2.4 DNI: 78809752E *)
type symbol = 
Character of char
| Range of char * char;;

type regexp = 
Empty
| EmptyExp 
| Any
| Repeat of regexp
| Or of regexp*regexp
| And of regexp*regexp
| Except of symbol 
| Symbol of symbol
| Concat of regexp*regexp;;

let symbol_of_char c = Character c;;
let symbol_of_range c1 c2 = Range (c1,c2);;

let empty = Empty;;
let empty_string = EmptyExp;;
let single s = Symbol s;;
let except s = Except s;;
let any = Any;;
let concat r1 r2 = Concat (r1, r2);;
let repeat r = Repeat r;;
let alt r1 r2 = Or (r1,r2);;
let all r1 r2 = And (r1,r2);;
