module type PersistentSet = sig
  type elt

  type t

  val empty : t

  val min_elt : t -> elt

  val mem : elt -> t -> bool

  val add : elt -> t -> t

  val remove : elt -> t -> t
end

module type Ordered = sig
  type t

  val compare : t -> t -> int
end

module Make (X : Ordered) : PersistentSet with type elt = X.t = struct
  type elt = X.t

  type t =
    | Empty
    | Node of t * elt * t

  let empty = Empty

  let rec min_elt = function
    | Empty -> raise Not_found
    | Node (Empty, v, __) -> v
    | Node (l, _, __) -> min_elt l

  let rec mem x = function
    | Empty -> false
    | Node (l, v, r) ->
        let c = X.compare x v in
        c = 0
        ||
        if c < 0 then
          mem x l
        else
          mem x r

  let rec add x t =
    match t with
    | Empty -> Node (Empty, x, Empty)
    | Node (l, v, r) ->
        let c = X.compare x v in
        if c = 0 then
          t
        else if c < 0 then
          Node (add x l, v, r)
        else
          Node (l, v, add x r)

  let rec remove_min_elt = function
    | Empty -> Empty
    | Node (Empty, _, r) -> r
    | Node (l, v, r) -> Node (remove_min_elt l, v, r)

  let merge t1 t2 =
    match (t1, t2) with
    | Empty, t | t, Empty -> t
    | _ -> Node (t1, min_elt t2, remove_min_elt t2)

  let rec remove x = function
    | Empty -> Empty
    | Node (l, v, r) ->
        let c = X.compare x v in
        if c = 0 then
          merge l r
        else if c < 0 then
          Node (remove x l, v, r)
        else
          Node (l, v, remove x r)
end

(** Int Tree *)
module Int_ordered = struct
  type t = int

  let compare = Stdlib.compare
end

module Int_set = Make (Int_ordered)

(** Functor Rule - To remove absatraction delete output type in make module, and
    if ran in utop you can then see the values*)
