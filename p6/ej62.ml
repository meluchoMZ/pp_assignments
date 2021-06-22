(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
let f = fun x -> x;;
(* val f : 'a -> 'a = <fun> *)
(********************************************************************)
let g = fun x -> x,x;;
(* val g : 'a -> 'a * 'a = <fun> *)
(********************************************************************)
let h = fun (x,y) -> x;;
(* val h : 'a * 'b -> 'a = <fun> *)
(********************************************************************)
let i = fun (x,y) -> y;;
(* val i : 'a * 'b -> 'b = <fun> *)
(********************************************************************)
let j = fun a -> a::[];;
(* val j : 'a -> 'a list = <fun> *)
(* Pódense definir infinitas funcións deste tipo*)
(********************************************************************)
let k a = List.nth [] 0;;
(********************************************************************)
let l a = [];;
(* Pódense definir infinitas funcións destes tipos, pero todoas son 
constantes ou todas dan fallo(raise...). *)
(********************************************************************)
(* Estas funcions dan o mesmo resultado pero non son a que se pide.
O motivo explicase abaixo. *)
(*let fun_123_ab l = List.length l + List.length ['a';'b'];;
let fun_123_ab f = let f, = List.length in (f [1;2;3]) + (f ['a';'b']);;*)

(* A funcion que se debia facer e esta, que non compila. *)
(*let fun_123_ab f = (f [1;2;3]) + (f ['a';'b']);;*)
(* Non se pode facer esa funcion xa que o compilador non e capaz de
realizar efectivamente o pattern-matching e pensa que f e unha function
definida de 'int list a int e por eso da erro de tipos ao recibir un
char list. Ainda que List.length esta definida "para todo 'a" de 'a list
a int, non hai xeito de definir un f tal que ("para todo" 'a list -> int) *)
(********************************************************************)
