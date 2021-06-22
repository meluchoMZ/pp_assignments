(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
(*********************************************************)
let hd = function
    h::_ -> h
    | [] -> raise(Failure "hd");;
(*********************************************************)
let tl = function
    _::t -> t
    | [] -> raise(Failure "tl");;
(*********************************************************)
let length l =
  let rec aux = function
      ([], i) -> i
      | (_::t, i) -> aux (t, i+1)
  in aux (l, 0);;
(*********************************************************)
let compare_lengths = function a -> function b ->
  if length a > length b then 1
  else if length a < length b then -1
       else 0;;
(*********************************************************)
let rec nth = function a -> function b ->
  if b < 0 then raise(Invalid_argument "List.nth")
  else if a = []  then raise(Failure "nth")
       else if b = 0 then hd a
            else nth (tl a) (b - 1);;
(*********************************************************)
let rec append = function l -> function p ->
  if l = [] then p
  else (hd l)::(append (tl l) p);;
(*********************************************************)
let rec rev_append a b =
  match a with
    [] -> b
  | h::t -> rev_append t (h::b);;
(*********************************************************)
let rec rev l = rev_append l [];;
(*********************************************************)
let init n f =
	if n < 0 then raise (Invalid_argument "init") else
    let rec aux (i,l) =
      if i = n then l
      else aux(i+1, (f i)::l)
    in rev(aux (0,[]));;
(*********************************************************)
let rec concat = function
  [] -> []
  | h::t ->  append h (concat t);;
(*********************************************************)
let flatten = concat;;
(*********************************************************)
let rec map f l = match l with
  [] -> []
  | h::t -> (f(h))::(map f t);;
(*********************************************************)
let rev_map f l=
  let rec aux dev = function
      [] -> dev
    | h::t -> aux ((f h)::dev) t
  in aux [] l;;
(*********************************************************)
let rec map2 f l p=
  if length l != length p then
    raise (Invalid_argument "map2")
  else if length l = 0 || length p = 0 then []
  else f (hd l)(hd p)::map2 f (tl l)(tl p);;
(*********************************************************)
let rec fold_left f a l = match l with
  [] -> a
  | h::t -> fold_left f (f a h) t;;
(*********************************************************)
let rec fold_right f l a = match l with
  [] -> a
  | h::t -> f h (fold_right f t a);;
(*********************************************************)
let rec find p l = match l with
  [] -> raise(Not_found)
  | h::t -> if (p h) then h else find p t;;
(*********************************************************)
let rec for_all p l = match l with
  [] -> false
  | h::t -> if (p h) then for_all p t else false;;
(*********************************************************)
let rec exists p l = match l with
  [] -> false
  | h::t -> if (p h) then true else exists p t;;
(*********************************************************)
let rec mem a l = match l with
  [] -> false
  | h::t -> if a = h then true else mem a t;;
(*********************************************************)
let filter p l =
  let rec aux dev = function
      [] -> rev dev
    | h::t -> if (p h) then aux (h::dev) t else aux dev t
  in aux [] l;;
(*********************************************************)
let not_filter p l =
  let rec aux dev = function
      [] -> rev dev
    | h::t -> if (p h)<>true then aux (h::dev) t else aux dev t
  in aux [] l;;
(*********************************************************)
let find_all = filter;;
(*********************************************************)
let partition p l = (filter p l),(not_filter p l);;
(*********************************************************)
let rec split l = match l with
  [] -> [],[]
  | (h,i)::t -> let (x,y) = split t in (h::x,i::y);;
(*********************************************************)
let rec combine la lb = match (la,lb) with
    [],[] -> []
    | [],_ -> raise(Invalid_argument "combine")
    | _,[] -> raise(Invalid_argument "combine")
    | h::t,p::q -> (h,p)::combine t q;;
