class Simon
  COLORS = ["red","blue","green","yellow"]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    p show_sequence
    @game_over = true unless require_sequence == @seq
    @sequence_length += 1
    round_success_message unless game_over
  end

  def show_sequence
    add_random_color
    @seq
  end

  def require_sequence
    puts "Please enter the color sequence separated by spaces: blue green red ..."
    user_input = gets.chomp.split(" ")
    return user_input
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "woohoo! ya got it"
  end

  def game_over_message
    puts "game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

p game = Simon.new
game.play