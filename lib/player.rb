class Player
  attr_reader :name, :wins
  attr_accessor :move
  
  def initialize(name, move = '')
    @name = name
    @move = move
    @wins = 0
  end

  def add_win
    @wins += 1
  end
end
