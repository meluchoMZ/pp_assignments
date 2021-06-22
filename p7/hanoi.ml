(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
let rec hanoi (ori,aux,dest) = function
    0 -> []
  | n -> hanoi (ori, dest, aux) (n - 1) @ (ori, dest)::hanoi (aux, ori, dest) (n - 1);;
