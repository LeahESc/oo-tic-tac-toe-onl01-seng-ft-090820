require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [[0, 1, 2,], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

  def initialize(board = nil) 
    @board = board || Array.new(9, " ")
  end 
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1 
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    # if @board[index] == "X" || @board[index] == "O" 
     @board[index] == "X" || @board[index] == "O" 
    # !(@board[index].nil? || @board[index] == " ") 
   
    # ?
    #   true 
    # else 
    #   false
    # end
  end 
  
    def valid_move?(position)
      # if 
        position.between?(0,8) && !position_taken?(position) 
      #   true
      # else
      # false
      # end 
    end
    
    def turn_count
    @board.count{|token| token == "X" || token == "O"}
    # @board.count{|token| token !=" "} 
    # @board.size{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0? "X" : "O" 
  end
     
  def turn
    # binding.pry
    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        puts "Move is invalid. Please enter 1-9"
        turn
      end
     
  end
  
  def won?
    WIN_COMBINATIONS.find {|combo|@board[combo[0]] == @board[combo[1]] && @board[combo[0]]==  @board[combo[2]]  && @board[combo[0]] != " " }
      #   
    # WIN_COMBINATIONS.each do |combo| 
      # if @board[combo[0]] == @board[combo[1]] && @board[combo[0]]==  @board[combo[2]]  &&
      #   @board[combo[0]] != " "
      #   return combo
      # elsif 
      # @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      # return combo
      # end
    # end
    # false
  end
  
  def full? 
    @board.any? {|n| n == " " }
      # return false
      # else
      #   return true
      # end
    end
 
  def draw? 
    !(won? && !full?)  
    #   return false
    # elsif !won? && full? 
    # return true
    # end
  end
     
  def over? 
     won? || draw? 
    #   return true
    # elsif !won? || !draw?
    #   false
    # end
  end
  
  def winner 
    w = won?
    @board[w[0]]
    
    # WIN_COMBINATIONS.each do |combo| 
    #   if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    #     return "X"
    #   elsif  @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    #   return "O"
    #   elsif draw? || !won?
    #   return nil
    #   end
    # end
  end
  
  def play 
    while !over?
     turn_count
     turn
   end
    if over? && won?
      puts "Congratulations #{winner}!"
    # return winner
    elsif over? && draw? 
      puts "Cat's Game!"
    end
  end


end 
