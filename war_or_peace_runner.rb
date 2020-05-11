require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'



#create cards
cards = []
suits = [:heart, :diamond, :spade, :club]
values = ['2', '3', '4', '5',
          '6', '7', '8', '9', '10',
          'Jack', 'Queen', 'King', 'Ace']
ranks = (1..14).to_a


#Cant get this working
def create_cards
  suits.each do |suit|
    values.each do |value|
      rank = ranks(value)
      cards << Card.new(suit, values, rank)
    end
  end
end

# put cards in 2 seperate decks
deck1 = []
deck2 = []

player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)


#create game class
class Game
  attr_reader :player1,
              :player2,
              :turn_count

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn_count = 0
  end

  def start_game
    p 'Welcome to War! (or Peace)'
    p 'This game will be played with 52 cards.'
    p 'The players today are Megan and Aurora.'
    p 'Type "GO" to start the game!'
    p '------------------------------------------------------------------'
    respose = gets.chomp.upcase
    if respose == 'GO'
      play_game
    else
      p  'Try Again!'
    end
  end

  def play_game
    turn = Turn.new(player1, player2)

    until player1.has_lost? || player2.has_lost?
     if turn.type == :basic
       winner = turn.winner
       turn.pile_cards
       turn.award_spoils(winner)
       turn_count += 1
       p "Turn #{turn_count}: #{winner.name} won 2 cards"

     elsif turn.type == :war
       winner = turn.winner
       turn.pile_cards
       turn.award_spoils(winner)
       turn_count += 1
       p "Turn #{turn_count}: *WAR* - #{winner.name} won 6 cards"

     elsif turn.type == :mutually_assured_destruction
       turn.pile_cards
       turn_count += 1
       p "Turn #{turn_count}: *mutually assured destruction* 6 cards removed from play"
     end
     #is this the proper use of break?
     break if turn_count == 1000000
    end
  end
end

game = Game.new(player1, player2)
game.start_game
game.play_game
