type t =
  | Empty
  | Leaf of int
  | Node of int * int * t * t

let zero_bit x b = x land b == 0

let rec mem x = function
  | Empty -> false
  | Leaf j -> x = j
  | Node (_, b, l, r) ->
      mem x
        (if zero_bit x b then
           l
         else
           r)

let rightmost_1_bit x = x land -x

let branch p1 t1 p2 t2 =
  let b = rightmost_1_bit (p1 lxor p2) in
  let p = p1 land (b - 1) in
  if zero_bit p1 b then
    Node (p, b, t1, t2)
  else
    Node (p, b, t2, t1)

let match_prefix x p b = x land (b - 1) == p

let rec add x = function
  | Empty -> Leaf x
  | Leaf j as t ->
      if j == x then
        t
      else
        branch x (Leaf x) j t
  | Node (p, b, l, r) as t ->
      if match_prefix x p b then
        if zero_bit x b then
          Node (p, b, add x l, r)
        else
          Node (p, b, l, add x r)
      else
        branch x (Leaf x) p t

