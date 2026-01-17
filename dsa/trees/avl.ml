module type PersistentSetAvl = sig
  type elt

  type t

  val empty : t

  val min_elt : t -> elt

  val balance : t -> elt -> t -> t

  val add : elt -> t -> t

  val remove_min_ele : t -> t

  val merge : t -> t -> t

  val remove : elt -> t -> t
end

module type Ordered = sig
  type t

  val compare : t -> t -> int
end

module Make (X : Ordered) : PersistentSetAvl with type elt = X.t = struct
  type elt = X.t

  type t =
    | Empty
    | Node of t * elt * t * int

  let empty = Empty

  let rec min_elt = function
    | Empty -> raise Not_found
    | Node (Empty, v, __, _) -> v
    | Node (l, _, __, _) -> min_elt l

  let height = function
    | Empty -> 0
    | Node (_, _, _, h) -> h

  let node l v r = Node (l, v, r, 1 + max (height l) (height r))

  let balance l v r =
    let hl = height l in
    let hr = height r in
    if hl > hr + 1 then begin
      match l with
      | Node (ll, lv, lr, _) when height ll >= height lr ->
          node ll lv (node lr v r)
      | Node (ll, lv, Node (lrl, lrv, lrr, _), _) ->
          node (node ll lv lrl) lrv (node lrr v r)
      | _ -> assert false
    end else if hr > hl + 1 then begin
      match r with
      | Node (rl, rv, rr, _) when height rr >= height rl ->
          node (node l v rl) rv rr
      | Node (Node (rll, rlv, rlr, _), rv, rr, _) ->
          node (node l v rll) rlv (node rlr rv rr)
      | _ -> assert false
    end else
      node l v r

  let rec add x = function
    | Empty -> Node (Empty, x, Empty, 1)
    | Node (l, v, r, _) as t ->
        let c = X.compare x v in
        if c = 0 then
          t
        else if c < 0 then
          balance (add x l) v r
        else
          balance l v (add x r)

  let rec remove_min_ele = function
    | Empty -> Empty
    | Node (Empty, _, r, _) -> r
    | Node (l, v, r, _) -> balance (remove_min_ele l) v r

  let merge t1 t2 =
    match (t1, t2) with
    | Empty, t | t, Empty -> t
    | _ -> balance t1 (min_elt t2) (remove_min_ele t2)

  let rec remove x = function
    | Empty -> Empty
    | Node (l, v, r, _) ->
        let c = X.compare x v in
        if c = 0 then
          merge l r
        else if c < 0 then
          balance (remove x l) v r
        else
          balance l v (remove x r)
end

(** Int Tree *)
module Int_ordered = struct
  type t = int

  let compare = Stdlib.compare
end

module Int_set = Make (Int_ordered)
