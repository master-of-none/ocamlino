(** Power of n *)
let rec npower x n =
  if n = 0 then
    1.0
  else
    x *. npower x (n - 1)

(** Even number *)
let even n = n mod 2 = 0

(** Efficient Power *)
let rec power x n =
  if n = 1 then
    x
  else if even n then
    power (x *. x) (n / 2)
  else
    x *. power (x *. x) (n / 2)

(** Sum of n Numbers *)
let rec nsum n =
  if n = 0 then
    0
  else
    n + nsum (n - 1)

(** Tail recursion *)
let rec summing n total =
  if n = 0 then
    total
  else
    summing (n - 1) (n + total)

(** Length of a list *)
let rec nlength = function
  | [] -> 0
  | _ :: xs -> 1 + nlength xs

(** Append list *)
let rec append x y =
  match (x, y) with
  | [], y -> y
  | x :: xs, y -> x :: append xs y

(** Reverse a list *)
let rec reverse = function
  | [] -> []
  | x :: xs -> reverse xs @ [ x ]

(** Sum of List's element *)
let rec sum_list = function
  | [] -> 0
  | _ :: xs -> 1 + sum_list xs

(** Both are Tail Recurisve function *)
let rec sum_list_tail list n =
  match list with
  | [] -> n
  | _ :: xs -> sum_list_tail xs (n + 1)

let length_of_list list =
  let rec aux acc = function
    | [] -> acc
    | _ :: xs -> aux (acc + 1) xs
  in
  aux 0 list

(** Last Element of list *)
let rec last_element = function
  | [] -> None
  | [ x ] -> Some x
  | _ :: xs -> last_element xs

let last_element_reverse list =
  match List.rev list with
  | [] -> None
  | x :: _ -> Some x

let rec even_elements = function
  | [] -> []
  | [ _ ] -> []
  | _ :: x :: xs -> x :: even_elements xs

(** Tails List *)
let rec tail_list list =
  match list with
  | [] -> [ [] ]
  | _ :: xs as l -> l :: tail_list xs

(** Take *)
let rec take n = function
  | [] -> []
  | x :: xs ->
      if n > 0 then
        x :: take (n - 1) xs
      else
        []

(** Drop *)
let rec drop n = function
  | [] -> []
  | x :: xs ->
      if n > 0 then
        drop (n - 1) xs
      else
        x :: xs

(** Linear Search *)
let rec linear_search x = function
  | [] -> false
  | y :: ys ->
      if x = y then
        true
      else
        linear_search x ys

(** List of pairs *)
let rec zip xs ys =
  match (xs, ys) with
  | x :: xs, y :: ys -> (x, y) :: zip xs ys
  | _ -> []

let rec unzip = function
  | [] -> ([], [])
  | (x, y) :: pairs ->
      let xs, ys = unzip pairs in
      (x :: xs, y :: ys)

(** Change *)
let rec change till amt =
  match (till, amt) with
  | _, 0 -> []
  | [], _ -> raise (Failure "No more Coins")
  | c :: till, amt ->
      if amt < c then
        change till amt
      else
        c :: change (c :: till) (amt - c)

(*? Sorting *)
let nextrandom seed =
  let a = 16807.0 in
  let m = 2147483647.0 in
  let t = a *. seed in
  t -. (m *. floor (t /. m))

let rec randlist (seed, seeds) = function
  | 0 -> (seed, seeds)
  | n -> randlist (nextrandom seed, seed :: seeds) (n - 1)

let seed, rs = randlist (1.0, []) 10000

(** Insertion Sort *)
let rec ins x = function
  | [] -> [ x ]
  | y :: ys ->
      if x <= y then
        x :: y :: ys
      else
        y :: ins x ys

let rec insort = function
  | [] -> []
  | x :: xs -> ins x (insort xs)

(** Quick Sort *)
let rec quick = function
  | [] -> []
  | [ x ] -> [ x ]
  | a :: bs ->
      let rec part l r = function
        | [] -> quick l @ (a :: quick r)
        | x :: xs ->
            if x <= a then
              part (x :: l) r xs
            else
              part l (x :: r) xs
      in
      part [] [] bs

let rec quik = function
  | [], sorted -> sorted
  | [ x ], sorted -> x :: sorted
  | a :: bs, sorted ->
      let rec part = function
        | l, r, [] -> quik (l, a :: quik (r, sorted))
        | l, r, x :: xs ->
            if x <= a then
              part (x :: l, r, xs)
            else
              part (l, x :: r, xs)
      in
      part ([], [], bs)

(** Merging 2 lists *)
let rec merge = function
  | [], ys -> ys
  | xs, [] -> xs
  | x :: xs, y :: ys ->
      if x <= y then
        x :: merge (xs, y :: ys)
      else
        y :: merge (x :: xs, ys)

(** Merge Sort *)
let rec mergesort = function
  | [] -> []
  | [ x ] -> [ x ]
  | xs ->
      let k = List.length xs / 2 in
      let l = mergesort (take k xs) in
      let r = mergesort (drop k xs) in
      merge (l, r)

(** Bubble Sort *)
let rec bubblepass = function
  | [] -> []
  | [ x ] -> [ x ]
  | x :: y :: xs ->
      if x <= y then
        x :: bubblepass (y :: xs)
      else
        y :: bubblepass (x :: xs)

let rec bubblesort lst =
  let next = bubblepass lst in
  if next = lst then
    lst
  else
    bubblesort next

(** Selection Sort *)
let listmin = function
  | [] -> None
  | x :: xs ->
      let rec findmin cur = function
        | [] -> cur
        | h :: t ->
            if h < cur then
              findmin h t
            else
              findmin cur t
      in
      Some (findmin x xs)

let rec remove_first v = function
  | [] -> []
  | x :: xs ->
      if x = v then
        xs
      else
        x :: remove_first v xs

let rec selection = function
  | [] -> []
  | l -> (
      match listmin l with
      | None -> []
      | Some m -> m :: selection (remove_first m l))

(*? Data Types *)

(** Enumeration *)
type vehicle =
  | Bike
  | Motorbike
  | Car
  | Lorry

let wheels = function
  | Bike -> 2
  | Motorbike -> 2
  | Car -> 4
  | Lorry -> 18

type vehicle =
  | Bike
  | Motorbike of int
  | Car of bool
  | Lorry of int

let wheels = function
  | Bike -> 2
  | Motorbike _ -> 2
  | Car robin ->
      if robin then
        3
      else
        4
  | Lorry w -> w

(** Binary Tree *)
type 'a tree =
  | Leaf
  | Br of 'a * 'a tree * 'a tree

let tree =
  Br (1, Br (2, Br (4, Leaf, Leaf), Br (5, Leaf, Leaf)), Br (3, Leaf, Leaf))

(** Count nodes *)
let rec count = function
  | Leaf -> 0
  | Br (_, t1, t2) -> 1 + count t1 + count t2

(** Depth *)
let rec depth = function
  | Leaf -> 0
  | Br (_, t1, t2) -> 1 + max (depth t1) (depth t2)
