module type Bitv = sig
  type t

  val create : int -> bool -> t

  val length : t -> int

  val get : t -> int

  val set : t -> int -> bool -> unit
end
