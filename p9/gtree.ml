(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
type 'a g_tree = Gt of 'a * 'a g_tree list;;

let rec breadth_first = function
    Gt (x, []) -> [x]
  | Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2));;

      let breadth_first_t gt = match gt with
          Gt (x, []) -> [x]
        | Gt (x, y) ->
            let rec aux next l = function
                [] -> if next = [] then List.rev l
                      else aux [] l (List.rev next)
              | Gt (x, lh)::t -> aux (List.rev_append lh next) (x::l) t
            in aux [] [] [gt];;

(* Uso a funcion init para facer a a arbore *)
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


(* Este arbore causa que breadth_first encha o stack -> stack overflow. *)
let t = Gt (0, (init 500000 (fun x -> Gt (x, []))));;
