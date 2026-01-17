module type PersistentMap = sig
  type key

  type 'a t

  val empty : 'a t

  val add : key -> 'a -> 'a t -> 'a t

  val mem : key -> 'a t -> bool

  val find : key -> 'a t -> 'a

  val remove : key -> 'a t -> 'a t
end

module type Ordered = sig
  type t

  val compare : t -> t -> int
end

module Make (X : Ordered) : PersistentMap with type key = X.t = struct
  type key = X.t

  type 'a t =
    | Empty
    | Node of 'a t * key * 'a * 'a t * int

  let empty = Empty

  let height = function
    | Empty -> 0
    | Node (_, _, _, _, h) -> h

  let node l k v r = Node (l, k, v, r, 1 + max (height l) (height r))

  let balance l k v r =
    let hl = height l in
    let hr = height r in
    if hl > hr + 1 then begin
      match l with
      | Node (ll, lk, lv, lr, _) when height ll >= height lr ->
          node ll lk lv (node lr k v r)
      | Node (ll, lk, lv, Node (lrl, lrk, lrv, lrr, _), _) ->
          node (node ll lk lv lrl) lrk lrv (node lrr k v r)
      | _ -> assert false
    end else if hr > hl + 1 then begin
      match r with
      | Node (rl, rk, rv, rr, _) when height rr >= height rl ->
          node (node l k v rl) rk rv rr
      | Node (Node (rll, rlk, rlv, rlr, _), rk, rv, rr, _) ->
          node (node l k v rll) rlk rlv (node rlr rk rv rr)
      | _ -> assert false
    end else
      node l k v r

  let rec mem x = function
    | Empty -> false
    | Node (l, k, _, r, _) ->
        let c = X.compare x k in
        c = 0
        ||
        if c < 0 then
          mem x l
        else
          mem x r

  let rec find x = function
    | Empty -> raise Not_found
    | Node (l, k, v, r, _) ->
        let c = X.compare x k in
        if c = 0 then
          v
        else if c < 0 then
          find x l
        else
          find x r

  let rec add x data = function
    | Empty -> Node (Empty, x, data, Empty, 1)
    | Node (l, k, v, r, _) ->
        let c = X.compare x k in
        if c = 0 then
          Node (l, x, data, r, 1 + max (height l) (height r))
        else if c < 0 then
          balance (add x data l) k v r
        else
          balance l k v (add x data r)

  let rec min_binding = function
    | Empty -> raise Not_found
    | Node (Empty, k, v, _, _) -> (k, v)
    | Node (l, _, _, _, _) -> min_binding l

  let rec remove_binding = function
    | Empty -> Empty
    | Node (Empty, _, _, r, _) -> r
    | Node (l, k, v, r, _) -> balance (remove_binding l) k v r

  let merge t1 t2 =
    match (t1, t2) with
    | Empty, t | t, Empty -> t
    | _ ->
        let k, v = min_binding t2 in
        balance t1 k v (remove_binding t2)

  let rec remove x = function
    | Empty -> Empty
    | Node (l, k, v, r, _) ->
        let c = X.compare x k in
        if c < 0 then
          merge l r
        else if c < 0 then
          balance (remove x l) k v r
        else
          balance l k v (remove x r)
end

(** Int Map *)
module Int_ordered = struct
  type t = int

  let compare = Stdlib.compare
end

module Int_map = Make (Int_ordered)
