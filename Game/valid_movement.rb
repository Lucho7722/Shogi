require '../Game/movement_rules'
def valid_movement xi, yi, xf, yf, tp, turn, board
  list = movs
  valid = false
  xd = xf-xi
  yd = yf-yi
  unless tp == "hourse"
    xd = "P" if xd > 1
    xd = "N" if xd < -1
    yd = "P" if yd > 1
    yd = "N" if yd < -1
  end
  valid = true if list[tp.to_s].include?([xd,yd])
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
  a = xi
  b = yi
  if xd == "P" && yd == 0
    a += 1
    while a < xf
      valid = false unless board[a][b].nil?
      a += 1
    end
    return valid unless valid
  end

  if xd == 0 && yd == "P"
    b += 1
    while b < yf
      valid = false unless board[a][b].nil?
      b += 1
    end
    return valid unless valid
  end

  if xd == "N" && yd == 0
    a -= 1
    while a > xf
      valid = false unless board[a][b].nil?
      a += 1
    end
    return valid unless valid
  end

  if xd == 0 && yd == "N"
    b -= 1
    while b > xf
      valid = false unless board[a][b].nil?
      b += 1
    end
    return valid unless valid
  end

  if xd == "P" && yd == "P"
    a += 1
    b += 1
    while a < xf
      valid = false unless board[a][b].nil?
      a += 1
      b += 1
    end
    return valid unless valid
  end
  if xd == "P" && yd == "N"
    a += 1
    b -= 1
    while a < xf
      valid = false unless board[a][b].nil?
      a += 1
      b -= 1
    end
    return valid unless valid
  end
  if xd == "N" && yd == "P"
    a -= 1
    b += 1
    while a > xf
      valid = false unless board[a][b].nil?
      a -= 1
      b += 1
    end
    return valid unless valid
  end
  if xd == "N" && yd == "N"
    a -= 1
    b -= 1
    while a > xf
      valid = false unless board[a][b].nil?
      a -= 1
      b -= 1
    end
    return valid unless valid
  end
  valid
end