(* Miguel Blanco Godón Grupo 2.4 DNI: 78809752E *)
open Regexp;;
let regexp_of_string s = Regexp_parser.main Regexp_lex.token (Lexing.from_string s);;
let rec nullable r = match r with
Empty -> Empty 
| EmptyExp -> EmptyExp
| Symbol r -> Empty 
| Any -> Empty 
| Except r -> Empty 
| Concat (r1,r2) -> if nullable r1 = EmptyExp && nullable r2 = EmptyExp then EmptyExp else Empty 
| Repeat r -> EmptyExp
| Or (r1,r2) -> if nullable r1 = EmptyExp || nullable r2 = EmptyExp then EmptyExp else Empty 
| And (r1,r2) -> if nullable r1 = EmptyExp && nullable r2 = EmptyExp then EmptyExp else Empty;;
	
	let rec derive a r = match r with
		  Empty -> Empty
		| EmptyExp -> Empty
		| Symbol(Character b) -> if a = b then EmptyExp else Empty
		| Except (Character r) -> if a <> r then EmptyExp else Empty 
		| Symbol (Range(r,s)) -> if r <= a && a <= s then EmptyExp else Empty
		| Except (Range(r,s)) -> if a < r || a > s then EmptyExp else Empty
		| Any -> EmptyExp 
		| Concat (r,s) ->Or (Concat (derive a r, s), Concat (nullable r,derive a s))
		| Repeat r -> Concat (derive a r, Repeat r)
		| Or (r,s) -> Or (derive a r, derive a s)
		| And (r,s) -> And (derive a r, derive a s);;

let rec simplify = function
	 Concat(r,s) -> let sr,ss = (simplify r, simplify s) in if sr=Empty || ss=Empty then Empty else if sr = EmptyExp then ss else if ss=EmptyExp then sr else Concat (sr, ss)
	|Repeat EmptyExp -> EmptyExp 
	|Repeat Empty -> Empty 
	|Or (r,s) -> let sr, ss = (simplify r, simplify s) in if sr=Empty then ss else if ss=Empty then sr else Or (sr, ss)
	|And (r,s) -> let sr, ss = (simplify r, simplify s) in if sr=Empty || ss=Empty then Empty else And (sr, ss)
	| x -> x;;

let matches_regexp s r = 
	let rec aux rd cont = 
		if String.length s > cont then aux (derive (s.[cont]) (simplify rd)) (cont+1) 
		else nullable rd=EmptyExp
	in aux ( r) 0;;
	
let matches s1 s2 = matches_regexp s1 (regexp_of_string s2);;
