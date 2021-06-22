(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
type 'a bin_tree = Empty | Node of 'a * 'a bin_tree * 'a bin_tree;;



let bt = Node (1, Node (2, Node (4, Empty, Empty), Node (5, Empty, Empty)), Node (3, Node (6, Empty, Empty), Node (7, Empty, Empty)));;



let rec breadth_first bin =
  let rec aux acc = function
      [] -> List.rev acc
    | Empty::t -> aux acc t
    | Node (x, i, d)::t -> aux (x::acc) (t @ [i;d])
  in aux [] [bin];;
