type 'a t =
  { default: 'a
  ; mutable size: int
  ; mutable data: 'a array
  }

let length a = a.size

let make n d = { default = d; size = n; data = Array.make n d }

let get a i =
  if i < 0 || i >= a.size then invalid_arg "get";
  a.data.(i)
