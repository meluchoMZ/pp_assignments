(**********************************)
(* Miguel Blanco God�n   Grupo 2.4*)
(**********************************)
open Bintree;;

let rec strict bin = match bin with
    Node (r, Empty,Empty) -> true
  | Node (r, i ,Empty) -> false
  | Node (r, Empty, d) -> false
  | Node (r, i, d) -> (strict i) && (strict d)
  | Empty -> true;;


(* Esta non sab�a facela asi que esta definici�n s� est� para que compile o mli *)
let perfect bin = strict bin && true;;


let rec complete bin = match bin with
    Node (r, Empty,Empty) -> true
  | Node (r, i ,Empty) -> true
  | Node (r, Empty, d) -> false
  | Node (r, i, d) -> (complete i) && (complete d)
  | Empty -> true;;
