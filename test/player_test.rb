require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require "pry"

class PlayerTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, 'Queen', 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, 'Ace', 14)
    @card4 = Card.new(:club, '5', 5)
    cards = [@card1, @card2, @card3]
    @deck = Deck.new(cards)
    @player = Player.new('Clarisa', @deck)
  end

  def test_it_exists
    assert_instance_of Player, @player
  end

  def test_it_has_a_name
    assert_equal "Clarisa", @player.name
  end

  def test_it_has_a_deck
    assert  true, @player.deck
  end

  def test_it_can_lose
    @player.deck.remove_card
    refute @player.has_lost?

    @player.deck.remove_card
    refute @player.has_lost?

    @player.deck.remove_card
    assert @player.has_lost?

    assert_equal [], @player.deck.cards
  end
end
