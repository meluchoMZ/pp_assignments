(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
let rec split = function
    [] -> [], []
  | h::[] -> [h], []
  | h1::h2::t -> let t1,t2 = split  t in (h1::t1, h2::t2);;

let rec merge ord l1 l2 = match l1,l2 with
    [],l | l,[] -> l
  | h1::t1, h2::t2 -> if ord h1 h2 then h1::merge ord t1 l2
                      else h2::merge ord l1 t2;;

let rec msort1 ord l = match l with
    [] | _::[] -> l
  | _ -> let l1,l2 = split l in
         merge ord (msort1 ord l1) (msort1 ord l2);;


(* Os problemas da non terminalidade son que con listas grandes da stack overflow*)
(* Por exemplo, definido unha lista: *)
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

(*funcion que devolve a lista: *)
let rlist bound n = init n (fun _ -> Random.int bound);;
let l2 = rlist 500000 500000;;
(* Con esta lista daria stack overflow *)
let split_t l = match l with
	[] -> [], []
  | h::[] -> [h], []
  | h::t -> let rec aux posicion par impar = function
  					[] -> impar,par
  				| h::t -> if posicion mod 2 = 0 then aux (posicion + 1)(h::par) impar t
  					      else aux (posicion + 1) par (h::impar) t
  			in aux 1 [] [] l;;

let append l1 l2 =
  if l1 = [] then l2 else
    let rec aux dev li1 li2 = match li1,li2 with
        [],[]-> List.rev dev
      | [],p::q -> aux (p::dev) [] q
      | h::t,[] -> aux (h::dev) t []
      | h::t,p::q -> aux (h::dev) t (p::q)
    in aux [] l1 l2;;

let merge_t ord l1 l2 = match l1,l2 with
	[],l | l,[] -> l
	| h::t,p::q -> let rec aux dev = function
		[],[] -> List.rev dev
		| l,[] -> append (List.rev dev) l
		| [], l -> append (List.rev dev) l
		| h2::t2,p2::q2 -> if (ord h2 p2) then aux (h2::dev) (t2,(p2::q2))
						   else aux (p2::dev) ((h2::t2,q2))
	in aux [] (l1,l2);;

  let rec msort2 ord l = match l with
      [] | _::[] -> l
    | _ -> let l1,l2 = split_t l in
           merge_t ord (msort1 ord l1) (msort1 ord l2);;

(*
let crono f x =
   let t = Sys.time () in
     f x; Sys.time () -. t;;
para comprobar a mellora usase a funcion crono e o vector lrandom
let l2 = rlist 50000 50000;;*)

(* Na miña máquina, ao executar msort1 obtiven o seguinte resultado:
# crono (msort1 (<=)) l2;;
- : float = 0.0893730000000000357
Ao executar msort2 obtiven o seguinte:
crono (msort1 (<=)) l2;;
- : float = 0.166025999999999951

Debido a miña implementación, tarda aproximadamente o dobre
xa que antes de devolver a lista debe darlle a volta, o cal
multiplica por n a complexidade de msort;
malia todo isto, ao aumentar o tamaño do vector a 300000 elementos:

# crono (msort1 (<=)) l2;;
Stack overflow during evaluation (looping recursion?).
# crono (msort2 (<=)) l2;;
- : float = 1.255133

Podemos observar como msort2 é capaz de ordenar os vectores
que msort1 non. Isto débese á terminalidade de split_t e
de merge_t, o que permite vectores maiores.

Respecto a qsort3:
# crono (qsort3 (<=)) lrandom;;
- : float = 0.780301000000000577

Outra vez, debido a implementación que lle din a msort, qsort3 e mais
eficicente. Tampouco ten problemas co tamaño do vector.
*)
