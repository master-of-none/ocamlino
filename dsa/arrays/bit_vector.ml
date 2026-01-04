module type Bitv = sig
  type t

  val create : int -> bool -> t

  val length : t -> int

  val get : t -> int -> bool

  val set : t -> int -> bool -> unit
end

let bpi = Sys.word_size - 1

let max_length = Sys.max_array_length * bpi

type t =
  { length: int
  ; bits: int array
  }

let create n b =
  let initv =
    if b then
      -1
    else
      0
  in
  let q = n / bpi and r = n mod bpi in
  if r = 0 then
    { length = n; bits = Array.make q initv }
  else begin
    let a = Array.make (q + 1) initv in
    if b then a.(q) <- (1 lsl r) - 1;
    { length = n; bits = a }
  end

let get v n =
  let i = n / bpi and j = n mod bpi in
  (v.bits.(i) lsr j) land 1 <> 0

let set v n b =
  let i = n / bpi and j = n mod bpi in
  if b then
    v.bits.(i) <- v.bits.(i) lor (1 lsl j)
  else
    v.bits.(i) <- v.bits.(i) land lnot (1 lsl j)
