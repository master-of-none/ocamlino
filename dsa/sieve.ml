let calculate_prime max =
  let prime = Array.make (max + 1) true in
  prime.(0) <- false;
  prime.(1) <- false;

  let limit = truncate (sqrt (float max)) in
  for n = 2 to limit do
    if prime.(n) then
      let m = ref (n * n) in

      while !m <= max do
        prime.(!m) <- false;
        m := !m + n
      done
  done;
  prime
