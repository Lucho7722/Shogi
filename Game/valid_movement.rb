require '../Game/movement_rules'
def valid_movement xi, yi, xf, yf, tp, turn, board
  list = movs
  valid = false
  valid = true if list[tp.to_s].include?([xf-xi,yf-yi])
  return valid unless valid
  if tp == "king"
    unless board[xf][yf+1].nil?
      valid = false if board[xf][yf+1].prom
      valid = false unless ["h", "b"].include?(board[xf][yf+1].type_piece.letter) || turn%2==board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf+1][yf+1].nil?
      valid = false if board[xf+1][yf+1].prom
      valid = false if ["k", "g", "s", "b"].include?(board[xf+1][yf+1].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf+1][yf].nil?
      valid = false if board[xf+1][yf].prom
      valid = false if ["k", "g", "t"].include?(board[xf+1][yf].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf+1][yf-1].nil?
      valid = false if board[xf+1][yf-1].prom
      valid = false if ["k", "s", "b"].include?(board[xf+1][yf-1].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf][yf-1].nil?
      valid = false if board[xf][yf-1].prom
      valid = false if ["k", "g", "t"].include?(board[xf][yf-1].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf-1][yf-1].nil?
      valid = false if board[xf-1][yf-1].prom
      valid = false if ["k", "s", "b"].include?(board[xf-1][yf-1].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf-1][yf].nil?
      valid = false if board[xf-1][yf].prom
      valid = false if ["k", "g", "t"].include?(board[xf-1][yf].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf-1][yf+1].nil?
      valid = false if board[xf-1][yf+1].prom
      valid = false if ["k", "g", "s", "b"].include?(board[xf-1][yf+1].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf-1][yf+2].nil?
      valid = false if board[xf-1][yf+2].prom
      valid = false if ["h"].include?(board[xf-1][yf+2].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    unless board[xf+1][yf+2].nil?
      valid = false if board[xf+1][yf+2].prom
      valid = false if ["h"].include?(board[xf+1][yf+2].type_piece.letter) && turn%2!=board[xf][yf+1].player.number%2
      return valid unless valid
    end
    a = xf
    b = yf
    while b > 0
      b -= 1
      next if board[a][b].nil?
      valid = false if board[xf+1][yf+1].type_piece.letter == "t" && turn%2!=board[a][b].player.number%2
      return valid unless valid
      break
    end
    a = xf
    b = yf
    while b < 9
      b += 1
      next if board[a][b].nil?
      valid = false if board[xf+1][yf+1].type_piece.letter == "t" && turn%2!=board[a][b].player.number%2
      return valid unless valid
      break
    end
    a = xf
    b = yf
    while a > 0
      a -= 1
      next if board[a][b].nil?
      valid = false if board[xf+1][yf+1].type_piece.letter == "t" && turn%2!=board[a][b].player.number%2
      return valid unless valid
      break
    end
    a = xf
    b = yf
    while a < 9
      a += 1
      next if board[a][b].nil?
      valid = false if board[xf+1][yf+1].type_piece.letter == "t" && turn%2!=board[a][b].player.number%2
      return valid unless valid
      break
    end
    a = xf
    b = yf
    while a < 9 && b < 9
      a += 1
      b += 1
      next if board[a][b].nil?
      valid = false if board[xf+1][yf+1].type_piece.letter == "b" && turn%2!=board[a][b].player.number%2
      return valid unless valid
      break
    end
    a = xf
    b = yf
    while a > 0 && b > 0
      a -= 1
      b -= 1
      next if board[a][b].nil?
      valid = false if board[xf+1][yf+1].type_piece.letter == "b" && turn%2!=board[a][b].player.number%2
      return valid unless valid
      break
    end
    a = xf
    b = yf
    while a < 9 && b > 0
      a += 1
      b -= 1
      next if board[a][b].nil?
      valid = false if board[xf+1][yf+1].type_piece.letter == "b" && turn%2!=board[a][b].player.number%2
      return valid unless valid
      break
    end
    a = xf
    b = yf
    while a > 0 && b < 9
      a -= 1
      b += 1
      next if board[a][b].nil?
      valid = false if board[xf+1][yf+1].type_piece.letter == "b" && turn%2!=board[a][b].player.number%2
      return valid unless valid
      break
    end
  end

  valid
end