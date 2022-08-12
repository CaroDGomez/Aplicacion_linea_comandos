require './player'
require './messages'

class Game
  include Messages
  def initialize
    @player = Player.new
  end

  def start_game
    question = ""
    answer = ""
    puts WELCOME
    puts USER_NAME

    user_name = gets.chomp
    @player.name = user_name

    file = File.foreach("questions.txt") do |line|
      line_line = line.split(" - ")
      question = line_line[0]
      answer = line_line[1].gsub("\n",'')

      puts "#{question}"
      user_answer = gets.chomp.downcase

      while user_answer != answer
        wrong_answer
        user_answer = gets.chomp.downcase
      end

      if user_answer == answer
        good_answer
      end
    end
  end_game
  end

  def good_answer
    puts CORRECT_ANSWER
    @player.score = @player.score + 100
  end

  def wrong_answer
    puts WRONG_ANSWER
    @player.score = @player.score - 10
  end

  def end_game
    puts "El juego ha finalizado, tu score es: #{@player.score}, bien hecho"
  end
end
