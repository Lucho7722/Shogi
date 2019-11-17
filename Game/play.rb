require "../Game/draw_board"
require "../Game/init_board"


exit = false
while exit == false
  board = init_board
  game_over = false
  turn = 1
  while game_over == false
    draw(board)
    row_init = 0
    col_init = 0
    row_final = 0
    col_final = 0
    select_piece = false
    select_cell = false
    while select_piece == false
      while row_init < 1 || row_init > 9
        puts "Ingrese la fila de la pieza a mover"
        row_init = gets.chomp.to_i
      end
      while col_init < 1 || col_init > 9
        puts "Ingrese la columna de la pieza a mover"
        col_init = gets.chomp.to_i
      end
      # Verificar si se selecciono una pieza
      if board[row_init][col_init].nil?
        puts "No se ha seleccionado ninguna pieza válida, vuelva a ingresar los valores"
        col_init = row_init = 0
        redo
        # Verificar si la pieza seleccionada le pertenece
      elsif turn % 2 != board[row_init][col_init].player.number % 2
        puts "La pieza seleccionada no le corresponde, vuelva a ingresar los valores"
        col_init = row_init = 0
        redo
      else
        select_piece = true
      end
    end
    while select_cell == false
      while row_final < 1 || row_final > 9
        puts "Ingrese la fila de la casilla destino"
        row_final = gets.chomp.to_i
      end
      while col_final < 1 || row_final > 9
        puts "Ingrese la columna de la casilla destino"
        col_final = gets.chomp.to_i
      end
      # Verificar que el casillero no se encuentre ocupado por una pieza propia
      unless board[row_final][col_final].nil?
        if turn % 2 == board[row_final][col_final].player.number % 2
          puts "La casilla se encuentra ocupada por una pieza que le pertenece, debe seleccionar otra"
          col_final = row_final = 0
        else
          select_cell = true
        end
      else
        select_cell = true
      end

    end
    # Incrementar el contados de turno
    turn += 1
    game_over = true
  end
  exit = true
end
