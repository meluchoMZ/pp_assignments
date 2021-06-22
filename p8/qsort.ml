(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
let rec rev_append a b =
  match a with
    [] -> b
  | h::t -> rev_append t (h::b);;
(*********************************************************)
let rec rev l = rev_append l [];;
(*********************************************************)
let init n f =
    let rec aux (i,l) =
      if i = n then l
      else aux(i+1, (f i)::l)
    in rev(aux (0,[]));;
let rlist bound n = init n (fun _ -> Random.int bound);;
open List;;

let rec qsort1  ord = function
    [] -> []
  | h::t -> let after, before = partition (ord h) t in
            qsort1 ord before @ h :: qsort1 ord after;;
(* Non e recursiva terminal, polo cal non se pode aplicar
a listas moi longas (mais de 300_000 elementos). Ademais se resulta
que o pivote escollido e malo e queda moi longa a lista esquerda a
operacion (@) e moi ineficiente. *)

let rec qsort2 ord = function
    [] -> []
  | h::t -> let after, before = partition (ord h) t in
            rev_append (rev(qsort2 ord before)) (h :: qsort2 ord after);;
(* A vantaxe que presenta qsort2 é que permite ordenar listas mais
grandes debido a que malia non ser terminal fai menos chamadas recursivas,
que se o pivote esta ben escollido tendera a ser log(n), sendo n o tamaño
da lista. Pra un pivote malo, daria stack overflow.
No tocante á eficiencia de cada implementación, para un vector
xerado aleatoriamente :
*)
let l1 = rlist 50000 50000;;
(*
A función usada foi:
let crono f x =
   let t = Sys.time () in
     f x; Sys.time () -. t;;
Os datos son os seguintes:

crono (qsort1 (<=)) l1;;
- : float = 0.107250000000000512
# crono (qsort2 (<=)) l1;;
- : float = 0.136188999999999893

Podemos observar que qsort2 e aproximadamente un 30% mais lento
ca qsort1. Asi que se o conxunto de datos e pequeno, poderianos
interesar usar qsort1 xa que será máis rápido, pero se e grande
precisaríamos de qsort2.
*)

let qsort3 ord l =
  let rec sort_asc = function
      [] -> []
    | h::t -> let after, before = partition (ord h) t in
              rev_append (sort_des before) (h :: sort_asc after)
  and sort_des = function
      [] -> []
    | h::t -> let after, before = partition (ord h) t in
              rev_append (sort_asc before) (h :: sort_des after)
  in sort_asc l;;

(* Ao cronometrar qsort3 vese que un 15% mais rápida ca a qsort2.
Con todo, é máis lenta ca qsort1, aproximadamente un 10%.
Ante a vista dos resultados, sería a mellor opción xeral, xa que
permite ordenar vectores grandes (que qsort1 non) sen que a
diferenza temporal sexa demais.
*)
