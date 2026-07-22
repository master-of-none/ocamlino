module type Imperative = sig
  type 'a t

  (* val create : unit -> 'a t *)
end

(* module Imperative : Imperative = struct
  type 'a cell =
    { elt: 'a
    ; mutable next: 'a cell
    }

  type 'a t = 'a cell option ref
end *)
