(**********************************)
(* Miguel Blanco Godón   Grupo 2.4*)
(**********************************)
(*********************************************************)
let lowercase = function c -> if ((int_of_char c > 64) && (int_of_char c < 97))
then char_of_int(32 + int_of_char c) else c;;
(*********************************************************)
let uppercase = function c -> if ((int_of_char c > 96) && (int_of_char c < 123))
then char_of_int((-32) + int_of_char c) else c;;
(*********************************************************)
