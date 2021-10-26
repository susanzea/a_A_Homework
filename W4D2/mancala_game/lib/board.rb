require_relative "./player.rb"

class Board
  attr_accessor :cups, :stone

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @player_1 = Player.new(name1, 1)
    @player_2 = Player.new(name2, 2)
    @current_player = @player_1
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, cup_i|
      4.times { @cups[cup_i] << :stone unless cup_i == 6 || cup_i == 13 }
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 13
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    @cups[start_pos] = []
    curr_player_inst = @player_1.name == current_player_name ? @player_1 : @player_2
    p player_cups = curr_player_inst.side == 1 ? (0..6).to_a : (7..13).to_a
    end_cup_i = nil
    ended_on_empty = false

    (1..num_stones).each do |cups_down|
      end_pos = start_pos+cups_down
      cup_i = player_cups.include?(cups_down) ? (end_pos) % 13 : (end_pos+1) % 13
      end_cup_i = cup_i if cups_down == num_stones
      if end_cup_i != nil
        ended_on_empty = true if @cups[end_cup_i].empty?
      end

      @cups[cup_i] << :stone
      
    end

    self.render
    next_turn(end_cup_i)
    if ended_on_empty
      # @current_player = @current_player == @player_1  ? @player_2 : @player_1
      return :switch
    end

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side_1_empty = (0..6).to_a.all? { |cup_i| @cups[cup_i].empty? }
    side_2_empty = (7..13).to_a.all? { |cup_i| @cups[cup_i].empty? }
    return true if side_1_empty || side_2_empty
    false
  end

  def winner
    player_1_total = @cups[6].length
    player_2_total = @cups[13].length
    return :draw if player_1_total == player_2_total
    winner_name = player_1_total > player_2_total ? @player_1.name : @player_2.name
    return winner_name
  end
end
