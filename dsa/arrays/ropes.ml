module type STRING = sig
  type t

  type char

  val length : t -> int

  val empty : t

  val make : int -> char -> t

  val get : t -> int -> char

  val append : t -> t -> t

  val sub : t -> int -> int -> t
end

module type ROPE = sig
  module S : STRING

  include STRING with type char = S.char

  val of_string : S.t -> t

  (* val set : t -> int -> char -> t *)

  (* val delete_char : t -> int -> t

  val insert_char : t -> int -> char -> t

  val insert : t -> int -> t -> t *)
end

(* module Make (X : STRING) : ROPE with module S = X = struct end *)
