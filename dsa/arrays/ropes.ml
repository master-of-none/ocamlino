module type STRING = sig
  type t

  type char

  val length : t -> int

  val empty : t

  val make : int -> char -> t

  val get : t -> int -> char

  (* val append : t -> t -> t

  val sub : t -> int -> int -> t *)
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

module Make (X : STRING) : ROPE with module S = X = struct
  module S = X

  type char = S.char

  type t =
    | Str of S.t * int * int
    | App of t * t * int

  let empty = Str (S.empty, 0, 0)

  let length = function
    | Str (_, _, n) | App (_, _, n) -> n

  let of_string s = Str (s, 0, S.length s)

  let make n c = of_string (S.make n c)

  let rec unsafe_get t i =
    match t with
    | Str (s, ofs, _) -> S.get s (ofs + i)
    | App (t1, t2, _) ->
        let n1 = length t1 in
        if i < n1 then
          unsafe_get t1 i
        else
          unsafe_get t2 (i - n1)

  let get t i =
    if i < 0 || i >= length t then invalid_arg "get";
    unsafe_get t i
end
