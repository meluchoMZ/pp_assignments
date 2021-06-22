(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)

let u = 1 + 2 - 3 * 4 / 5;;
(* val u : int = 1 *)

let v = sin(5.);;
(* val v : float = 0.958924274663138454 *)

let w = char_of_int 65;;
(* val w : char = 'A' *)

let x = (sin(0.) == 1.);;
(* value x : bool = false *)

let y = if (Random.int(u) > 0) then "mayor" else "menor";;
(* val y : string = "menor" *)

let z = if (Random.int(87954648) > 0) then (u,u*u) else (u*u*u,u+3);;
(* val z : int * int = (1, 1) *)
