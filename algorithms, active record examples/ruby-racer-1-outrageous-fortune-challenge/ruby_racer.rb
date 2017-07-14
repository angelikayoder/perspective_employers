=begin
1) managing the state of the game (e.g., keeping track of player positions)
  array?
  create an empty array?
  each moves pushes a new position into array?
  each moves deletes an old position and adds new position into array?
  each position is an index in an array?
  a "player_a" array and a "player_b" array?

  Initial state
  Input: current_value
  Output: current_value
  {
    player_a: 0,
    player_b: 0
  }

UNLESS player_a or player_b >= 30, do this...

  After First turns
  Input: current_value
  Output: current_value + die roll value
  {
    player_a: 1,
    player_b: 5
  }

  After Second turns
  input: die roll value
  output: current_value + die roll value
  {
    player_a: 6,
    player_b: 7
  }

  UNTIL player_a or player_b value >= 30 then END

  The race is 30 units in length
  Determining the number of units to move each turn move is done with a die roll.
  Need to track the number of units per player


(2) transforming data from one structure to another (e.g. transforming the game data into a printable board)

=end

class RubyRacer
  attr_reader :players, :die, :length

  def initialize(players, die, length = 30)
    @player_values = {}
  players.each { |player| @player_values[player] = 0 }
  @players = players
  @die = die
  @length = length
  end

  # Returns +true+ if one of the players has reached
  # the finish line, +false+ otherwise
  def finished?
    player_over_30 = @player_values.select{ |player, value| value >= 30 }

  if player_over_30 == {}
    false
  else
    true
  end
  end

  # Returns the winner if there is one, +nil+ otherwise
  # Added .first method to return since without it, it allows several to win
  # now there can be only 1.
  def winner
    player_over_30 = @player_values.select{ |player, value| value >= 30 }
  if player_over_30 == {}
    nil
  else
    return player_over_30.keys.first
  end
  end

  # Rolls the die and advances +player+ accordingly
  # input: current_value of player position { :player_a => 25 }
  # output: current_value + roll
  # 1. roll the dice
  # 2. add the dice roll to the players value
  #
  def advance_player(player)
    roll = @die.roll
  if (@player_values[player] + roll) >= @length
    @player_values[player] = @length
  else
    @player_values[player] += roll
  end
  end

  # Returns the current state of the game as a string
  # that can be printed on the command line.
  # The board should have the same dimensions each time.
  # the board has 20 spaces in which the characters go.
  # Every other line is a pipe.
  #Had to reverse it so the horse and person are running to the left.
  def board_visualization
@players.each do |player|
  units = (0..@length).map { |index| ' ' }

  units[@player_values[player]] = player
  p units.join('|').reverse

  end
  nil
  end
end
