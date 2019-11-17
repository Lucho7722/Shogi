require '../Class/piece'
require '../Class/piece_type'
require '../Class/player'
def init_board
  player_1 = Player.new(1)
  player_2 = Player.new(2)
  king = Piece_type.new("king", "k")
  gold_general = Piece_type.new("gold_general", "g")
  silver_general = Piece_type.new("silver_general", "s")
  hourse = Piece_type.new("hourse", "h")
  spear = Piece_type.new("spear", "l")
  pawn = Piece_type.new("pawn", "p")
  tower = Piece_type.new("tower", "t")
  bishop = Piece_type.new("bishop", "b")
  board = {
      1=> {},
      2=> {},
      3=> {},
      4=> {},
      5=> {},
      6=> {},
      7=> {},
      8=> {},
      9=> {}
  }
  board[1][1] = Piece.new(player_2, spear)
  board[1][9] = Piece.new(player_2, spear)
  board[1][2] = Piece.new(player_2, hourse)
  board[1][8] = Piece.new(player_2, hourse)
  board[1][3] = Piece.new(player_2, silver_general)
  board[1][7] = Piece.new(player_2, silver_general)
  board[1][4] = Piece.new(player_2, gold_general)
  board[1][6] = Piece.new(player_2, gold_general)
  board[1][5] = Piece.new(player_2, king)
  board[2][2] = Piece.new(player_2, tower)
  board[2][8] = Piece.new(player_2, bishop)
  (1..9).each do |x|
    board[3][x] = Piece.new(player_2, pawn)
  end

  board[9][1] = Piece.new(player_1, spear)
  board[9][9] = Piece.new(player_1, spear)
  board[9][2] = Piece.new(player_1, hourse)
  board[9][8] = Piece.new(player_1, hourse)
  board[9][3] = Piece.new(player_1, silver_general)
  board[9][7] = Piece.new(player_1, silver_general)
  board[9][4] = Piece.new(player_1, gold_general)
  board[9][6] = Piece.new(player_1, gold_general)
  board[9][5] = Piece.new(player_1, king)
  board[8][2] = Piece.new(player_1, bishop)
  board[8][8] = Piece.new(player_1, tower)

  (1..9).each do |x|
    board[7][x] = Piece.new(player_1, pawn)
  end
  board
end
