(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
let split l = (List.map fst l),(List.map snd l);;
(*******************************************************************)
let combine l1 l2 = List.map2 (fun h p -> (h,p)) l1 l2;;
(*******************************************************************)
let length l = List.fold_left(fun acc h -> acc + 1) 0 l;;
(*******************************************************************)
let append l1 l2 = List.fold_right (fun h l -> h::l) l1 l2;;
(*******************************************************************)
let rev l = List.fold_left (fun a h -> h::a) [] l;;
(*******************************************************************)
let concat l = List.fold_right (@) l [];;
(*******************************************************************)
let partition p l = (List.filter p l),(List.filter (fun x -> not (p x)) l);;
(*******************************************************************)
let remove_all a l = List.filter (fun x -> x <> a) l;;
(*******************************************************************)
let remove_all a l1 =
  let rec aux l2 lrem = function
      [] -> List.rev(l2)
    | h::t -> if a = h then aux l2 (h::lrem) t else aux (h::l2) lrem t
  in aux [] [] l1;;

let ldif l1 l2 = List.fold_left (fun l h-> remove_all h l) l1 l2;;
(*******************************************************************)
let lprod l1 l2 = List.concat
(List.map (fun h -> List.map (fun p -> (h,p)) l2) l1);;
(*******************************************************************)
let comp = function f -> function g -> function x -> f(g(x));;
let multicomp = function
    [] -> raise(Invalid_argument "multicomp")
  | h::t -> List.fold_left (fun h -> comp h) h t;;
