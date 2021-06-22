(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)

(* Exercicio 1 *)

let f = function x -> function y -> function z ->
  if (z > y) then true else if (x <> y) then (z / (x - y) > y) else false;;

false && (2 / 0 > 0);;
(* - : bool = false *)

true && (2 / 0 > 0);;
(* Excepcion: Division entre 0. *)

true || (2 / 0 > 0);;
(* - : bool = true *)

false || (2 / 0 > 0);;
(* Excepcion: Division entre 0. *)

let con = (&&);;
(* val con : bool -> bool -> bool = <fun> *)

let dis = (||);;
(* val dis : bool -> bool -> bool = <fun> *)

(&&) (1 < 0) (2 / 0 > 0);;
(* - : bool = false *)

con (1 < 0) (2 / 0 > 0);;
(* Excepcion: Division por 0. *)

(||) (1 < 0) (2 / 0 > 0);;
(* Excepcion: Division por 0. *)

dis (1 < 0) (2 / 0 > 0);;
(* Excepcion: Division por 0. *)


(***************************************************)

(* Exercicio 2 *)
let curry = function f -> function a -> function b -> f(a,b);;
let uncurry = function f -> function a,b -> f a b;;

uncurry (+);;
(* - : int * int -> int = <fun> *)

let sum = (uncurry (+));;
(* val sum = int * int -> int <fun> *)

(* sum 1;; *)
(* Error de tipos: esperabase int * int e recibeu int. *)
sum (1, 1);;
(* - : int = 2*)

sum (2,1);;
(* - : int = 3 *)

let g = curry (function p -> 2 * fst p + 3 * snd p);;
(* val g = int -> int -> int = <fun> *)

(* g(2,5);; *)
(* Error de tipos: esperabase tipo int pero recibe 'a * 'b .*)
g(5);;
(* - : int -> int = <fun> *)
let h = g 2;;
(* val h : int -> int = <fun> *)
h 1, h 2, h 3;;
(* - : int * int * int = (7, 10, 13) *)


(*******************************************************************)
(* Exercicio 3 *)
let comp = function f -> function g -> function x -> f(g(x));;
let f2 = let square x = x * x in comp square ((+) 1);;
f2 1, f2 2, f2 3;;
(* - : int * int * int = (4, 9, 16) *)
(*******************************************************************)
