(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
let suml l =
  let rec aux n = function
      [] -> n
    | h::t -> aux (n + h) t
  in aux 0 l;;
(*******************************************************************)
let maxl l = match l with
  [] -> raise (Failure "maxl")
  | h::t -> let rec aux max = function
      [] -> max
    | h::t -> if h > max then aux h t else aux max t
  in aux (List.hd l) (List.tl l);;
(*******************************************************************)
let to0from n =
  if n < 0 then [] else let rec aux l acc =
       if acc = n+1 then l else aux (acc::l) (acc + 1)
    in aux [] 0;;
(*******************************************************************)
let fromto m n =
  if m > n then [] else
    let rec aux l acc =
      if acc < m then l else aux (acc::l) (acc - 1)
    in aux [] n;;
(*******************************************************************)
let from1to n =
  if n < 1 then [] else
    let rec aux l acc =
      if acc = n + 1 then List.rev l else aux (acc::l) (acc + 1)
    in aux [] 1;;
(*******************************************************************)
let append l1 l2 =
  if l1 = [] then l2 else
    let rec aux dev li1 li2 = match li1,li2 with
        [],[]-> List.rev dev
      | [],p::q -> aux (p::dev) [] q
      | h::t,[] -> aux (h::dev) t []
      | h::t,p::q -> aux (h::dev) t (p::q)
    in aux [] l1 l2;;
(*******************************************************************)
let map f l =
  if l = [] then [] else
    let rec aux dev= function
        [] -> List.rev dev
      | h::t -> aux ((f h)::dev) t
    in aux [] l;;
(*******************************************************************)
let power x y =
  if y < 0 then raise (Invalid_argument "power") else
      let rec aux acc y2 =
        if y2 = 0 then acc
        else aux (x * acc) (y2 - 1)
      in aux 1 y;;
(*******************************************************************)
let incseg l = let rec aux dev acc = function
      [] -> List.rev dev
    | p::q -> aux ((p+acc)::dev) (acc+p) q
  in aux [] 0 l;;
(*******************************************************************)
let remove x l =
  let rec aux dev = function
      [] -> l
    | h::t -> if h = x then List.rev_append dev t
              else aux (h::dev) t
  in aux [] l;;
(*******************************************************************)
let rec insert x l =
  let rec aux dev = function
      [] -> List.rev (x::dev)
    | h::t -> if x <=h then List.rev_append dev (x::h::t)
              else aux (h::dev) t
  in aux [] l;;
(*******************************************************************)
let insert_gen f x l =
  let rec aux dev = function
      [] -> List.rev (x::dev)
    | h::t -> if f x h then List.rev_append dev (x::h::t)
              else aux (h::dev) t
  in aux [] l;;
(*******************************************************************)
