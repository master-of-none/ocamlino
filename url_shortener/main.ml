open Shortener

let () =
  Random.self_init ();

  let store = create_store () in
  let long_url = "http://ocaml.org" in
  let code = shorten store long_url in
  Printf.printf "Short Code: %s\n" code;

  match resolve store code with
  | Some url -> Printf.printf "Resolved URL : %s\n" url
  | None -> print_endline "URL Not Found"
