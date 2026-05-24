module StringMap = Hashtbl

type store = (string, string) StringMap.t

let create_store () : store = StringMap.create 100

let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

let random_char () = chars.[Random.int (String.length chars)]

let generate_code length = String.init length (fun _ -> random_char ())

let shorten store long_url =
  let code = generate_code 5 in
  StringMap.replace store code long_url;
  code

let resolve store code = StringMap.find_opt store code
