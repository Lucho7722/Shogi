class Piece
  attr_accessor :prom, :player, :type_piece


  def initialize(player, type_piece)
    @prom = false
    @player = player
    @type_piece = type_piece
  end

end