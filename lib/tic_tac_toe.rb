require 'pry'

class TicTacToe
  
  WIN_COMBINATIONS = [[0, 1, 2,], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

  def initialize(board = nil) 
    @board = board || Array.new(9, " ")
  end 
  
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "--------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "--------------" 
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 

  def input_to_index(input)
    input.to_i-1
  end 

  def move(index, character='X')
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == ' '
      false
    else  
      true 
    end 
  end

  def valid_move?(index)
    if index <= 8 && index >= 0 && !position_taken?(index)
      true
    else  
      false 
    end
  end 

  def turn_count()
    # binding.pry
    @board.count {|element| element == 'X' || element == 'O'}
  end 

  def current_player() 
    if turn_count % 2 == 0 
      'X'
    else  
      'O'
    end
  end 

  def turn()
    puts "Please type a number 1-9 where you would like to move"
    input = gets.strip
    idx = input_to_index(input)
    if valid_move?(idx)
      cp = current_player
      move(idx, cp)
      display_board()
    else
      turn()
    end 
  end 

  def won? 
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == 'X' && @board[combo[1]] == 'X' && @board[combo[2]] == 'X'
        return combo 
      elsif  @board[combo[0]] == 'O' && @board[combo[1]] == 'O' && @board[combo[2]] == 'O'
        return combo
      end
    end 
    false
  end 

  def full?
    if @board.any? {|ele| ele == ' '}
    return false
    end 
    true
  end

  def draw? 
    if !won? && full? 
      return true
    end
    false 
  end

  def over? 
    if !draw? && !won? 
      return false 
    end 
    true
  end 

  def winner
    if won? 
      if @board[won?[0]] == 'X'
        return 'X'
      else  
        return 'O'
      end 
    else  
      return nil 
    end 
  end 

  def play
    while !over?
      turn_count
      turn 
    end 
    if over? && won? 
      puts "Congratulations #{winner}!"
    else
    puts "Cat's Game!"
    end 
  end 

end 