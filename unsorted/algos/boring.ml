(** Power of n *)
let rec npower x n = if n = 0 then 1.0 else x *. npower x (n - 1)

(** Even number *)
let even n = n mod 2 = 0

(** Efficient Power *)
let rec power x n =
  if n = 1 then x
  else if even n then power (x *. x) (n / 2)
  else x *. power (x *. x) (n / 2)

(** Sum of n Numbers *)
let rec nsum n = if n = 0 then 0 else n + nsum (n - 1)

(** Tail recursion *)
let rec summing n total = if n = 0 then total else summing (n - 1) (n + total)

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
