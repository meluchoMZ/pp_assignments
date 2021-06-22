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
let rec length = function
    [] -> 0
    | _::t -> 1 + length t;;
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
let rec rev = function
  [] -> []
  | h::t -> append (rev t) [h];;
(*********************************************************)
let rec init len f = if len < 0 then raise(Invalid_argument "init")
  else rev((f len)::init (len-1) f);;
(*********************************************************)
let rev_append a b = append(rev a) b;;
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
let rec rev_map = map;;
(*********************************************************)
let rec map2 f l p=
  if length l != length p then
    raise (Invalid_argument "map2")
  else if length l == 0 || length p == 0 then []
  else f (hd l)(hd p)::map2 f (tl l)(tl p);;
(*********************************************************)
let rec find e l = match l with
  [] -> raise(Not_found)
  | h::t -> if h == e then true else find e t;;
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
  | h::t -> if (p h) == true then h else find p t;;
(*********************************************************)
let rec for_all p l = match l with
  [] -> false
  | h::t -> if (p h) == true then (true && for_all p t) else false;;
(*********************************************************)
let rec exists p l = match l with
  [] -> false
  | h::t -> if (p h) == true then true else exists p t;;
(*********************************************************)
let rec mem a l = match l with
  [] -> false
  | h::t -> if a == h then true else mem a t;;
(*********************************************************)
let rec filter p l = match l with
  [] -> []
  | h::t -> if (p h) == true then h::(filter p t) else (filter p t);;
(*********************************************************)
let rec not_filter p l = match l with
  [] -> []
  | h::t -> if (p h) != true then h::(filter p t) else (filter p t);;
(*********************************************************)
let find_all = filter;;
(*********************************************************)
let partition p l = (filter p l),(not_filter p l)
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
