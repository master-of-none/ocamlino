open Dsa

let () =
  Graphics.open_graph " 256x256";
  Quad_trees.draw 0 0 256 (Quad_trees.checker_board 3);
  ignore (Graphics.read_key ())
