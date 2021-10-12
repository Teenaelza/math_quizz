require './player'
require './question'
require 'pp'
class Game
  def initialize
    @player1=Player.new("Player1")
    @player2=Player.new("Player2")
    @questions=Question.new()
    @question=@questions.get_question
    @players = [@player1, @player2].shuffle
    @turn=3
  end
  def get_p1(player)
    player.first
  end 
  def get_p2(player)
    player.last
   end 
  def check_answer?(question,ans)
    question[:a]==ans
  end 
  def getWinner
    @players.select{|player|player.score>0}[0]
  end
  def play

    while @player1.score>0 && @player2.score>0 
      player=[@player1, @player2].shuffle
      p1=get_p1(player)
      p2=get_p2(player)
      question=@questions.get_question
      puts "--------NEW TURN ---------------"
      puts "#{p1.name}: #{question[:q]}" 
      print ">"
      ans=$stdin.gets.chomp.to_i
      if check_answer?(question,ans) 
        puts "#{p1.name}: Yes ! you are correct."
      elsif 
        p1.score -= 1
        puts "#{p1.name}: Seriously ! Wrong Answer."
      end
      puts "#{p1.name}: #{p1.score}/#{@turn}  VS  #{p2.name}: #{p2.score}/#{@turn}"
    end
    puts "---------------- Game Over! ---------------"
    puts "The winner is #{getWinner.name} with a score of #{getWinner.score}/#{@turn}"  
  end
end