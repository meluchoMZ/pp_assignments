(* Miguel Blanco Godón Grupo 2.4 DNI: 78809752E *)
open Array;;
open Sys;;
open Filename;;
open Regexp;;
open Derive;;


let listar arr = 
	for cont = 0 to length arr -1 do
	let s = get arr cont in 
		if matches (get arr cont) (get argv 1)  then (print_string ((dirname s)^dir_sep ^ s); print_newline ();) else () done; ();;


let find () = 
if length argv <> 3 then raise (Failure "Bad syntax: ./find string directory") else
if not (file_exists (get argv 2)) then raise (Failure "No such file or directory.")
else if not (is_directory (get argv 2)) then raise (Failure "Is not a directory.")
else let rec aux dname = 
 let dir = readdir dname in
 	(listar dir;
	for i = 0 to length dir -1 do
		print_string (get dir i); print_newline ();
		if (is_directory (get dir i)) then aux ((dirname dname)^dir_sep^(get dir i)) 
		else ()
	 done; ();)
 in aux (get argv 2);;
(*listar (readdir (get argv 2));;*)

find ();;




(*let rec aux name = 
	listar (readdir name);
	for i = 0 to length (readdir name) - 1 do 
		if (is_directory) (get (readdir name) i) then aux (get (readdir name))
		else ()
	done; ();;
in aux (get argv 2)



let rec aux name = 
		let arr = readdir name in
			listar arr ;
			for i = 0 to length arr - 1 do 
				if (is_directory (get arr i)) then aux (get arr i)
				else ()
			done; ();;
	in aux (get argv 2);;
			*)
