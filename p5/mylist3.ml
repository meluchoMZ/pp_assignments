(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
let remove a l1 =
  let rec aux l2 = function
      [] -> l1
    | h::t -> if a = h then List.rev_append l2 t else aux (h::l2) t
  in aux [] l1;;
(********************************************************************)
let remove_all a l1 =
  let rec aux l2 lrem = function
      [] -> List.rev(l2)
    | h::t -> if a = h then aux l2 (h::lrem) t else aux (h::l2) lrem t
  in aux [] [] l1;;
(********************************************************************)
let rec ldif l1 l2 = match l1,l2 with
    [],_ -> []
  |  _,[] -> l1
  | h::t,p::q -> ldif (remove_all p l1) q;;
(********************************************************************)
let lprod l1 l2 =
  let rec aux dev n = function l -> function
        [] -> List.rev dev
      | h::t -> if n = 0 then aux dev (List.length l2) l2 t
                else aux ((h,List.hd l)::dev) (n - 1) (List.tl l) (h::t)
  in aux [] (List.length l2) l2 l1;;
(********************************************************************)
let divide l =
  let rec aux acum par impar = function
      [] -> (List.rev par, List.rev impar)
    | h::t -> if (acum mod 2) = 0 then aux (acum + 1) (h::par) impar t
              else aux (acum + 1) par (h::impar) t
  in aux 0 [] [] l;;
