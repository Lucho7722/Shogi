def draw board
  puts "1  2  3  4  5  6  7  8  9 "
  (1..9).each do |x|
    (1..9).each do |y|
      direction = "↑"
      printf "   " if board[x][y].nil?
      unless board[x][y].nil?
        direction = "↓" if  board[x][y].player.number == 2
        printf board[x][y].type_piece.letter.to_s + direction.to_s + " " unless board[x][y].nil?
      end
      puts x if y == 9
    end
  end
end