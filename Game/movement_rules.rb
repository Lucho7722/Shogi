def movs
  valids_movs = {
      "king"=>[[0,1], [1,1], [1,0], [1,-1], [-1,-1], [0,-1], [-1,-1], [-1,0], [-1,1]],
      "gold_general"=> [[0,1], [1,1], [1,0], [0,-1], [-1,0], [-1,1]],
      "silver_general"=> [[0,1],[1,1], [1,-1], [-1,-1], [-1,1]],
      "hourse"=>[[1,2],[-1,2]],
      "spear"=>[[0, "P"], [0,1]],
      "pawn"=>[0,1],
      "tower"=>[[0, "P"], ["P","P"], [0, "N"], ["N", 0], [0,1], [1,0], [0,-1], [-1,0]],
      "bishop"=>[["P", "P"], ["P","N"], ["N", "N"], ["N, P"], [1,1], [1,-1], [-1,-1], [-1,1]]
  }
  valids_movs
end