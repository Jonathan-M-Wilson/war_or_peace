require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/card'
require './lib/deck'
require './lib/turn'
require "pry"

class TurnBasicTest < Minitest::Test


  #Index
  #test_it_exists
  #test_players_make_turns
  #test_spoils_of_war_holds_cards
  #test_it_has_type
  #test_it_has_winner
  #test_it_can_pile_cards
  #test_it_can_award_spoils


  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_instance_of Turn, turn
  end

  def test_players_make_turns
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.player1
    assert_equal player2, turn.player2
  end

  def test_spoils_of_war_holds_cards
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal [], turn.spoils_of_war
  end

  def test_it_has_type_of_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    refute player1.deck.rank_of_card_at(0) ==
    player2.deck.rank_of_card_at(0)

    assert_equal :basic, turn.type

  end

  def test_it_has_winner_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_it_can_pile_cards_when_type_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards

    assert_equal turn.spoils_of_war, turn.pile_cards
  end

  def test_it_awards_spoils_to_turn_winner_type_basic
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    deck1 = Deck.new([card1, card2, card5, card8])
    deck2 = Deck.new([card3, card4, card6, card7])

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal 5, winner.deck.cards.count
  end

  def test_it_has_type_of_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    war_deck1 = Deck.new([card1, card2, card3, card5])
    war_deck2 = Deck.new([card4, card6, card7, card8])

    player1 = Player.new("Megan", war_deck1)
    player2 = Player.new("Aurora", war_deck2)

    turn = Turn.new(player1, player2)

    assert_equal :war, turn.type
  end

  def test_it_has_winner_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    war_deck1 = Deck.new([card1, card2, card3, card5])
    war_deck2 = Deck.new([card4, card6, card7, card8])

    player1 = Player.new("Megan", war_deck1)
    player2 = Player.new("Aurora", war_deck2)

    turn = Turn.new(player1, player2)

    assert_equal player1, turn.winner
  end

  def test_it_can_pile_cards_when_type_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    war_deck1 = Deck.new([card1, card2, card3, card5])
    war_deck2 = Deck.new([card4, card6, card7, card8])

    player1 = Player.new("Megan", war_deck1)
    player2 = Player.new("Aurora", war_deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards

    assert_equal turn.spoils_of_war, turn.pile_cards
  end

  def test_it_awards_spoils_to_turn_winner_type_war
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    war_deck1 = Deck.new([card1, card2, card3, card5])
    war_deck2 = Deck.new([card4, card6, card7, card8])

    player1 = Player.new("Megan", war_deck1)
    player2 = Player.new("Aurora", war_deck2)


    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal 7, winner.deck.cards.count
  end

  def test_it_has_type_mad
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    mad_deck1 = Deck.new([card1, card2, card3, card5])
    mad_deck2 = Deck.new([card4, card6, card9, card8])

    player1 = Player.new("Megan", mad_deck1)
    player2 = Player.new("Aurora", mad_deck2)

    turn = Turn.new(player1, player2)

    assert_equal :mutually_assured_destruction, turn.type
  end

  def test_it_has_winner_mad
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    mad_deck1 = Deck.new([card1, card2, card3, card5])
    mad_deck2 = Deck.new([card4, card6, card9, card8])

    player1 = Player.new("Megan", mad_deck1)
    player2 = Player.new("Aurora", mad_deck2)

    turn = Turn.new(player1, player2)


    assert_equal "No Winner", turn.winner
  end

  def test_it_can_pile_cards_when_type_mad
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    mad_deck1 = Deck.new([card1, card2, card3, card5])
    mad_deck2 = Deck.new([card4, card6, card9, card8])

    player1 = Player.new("Megan", mad_deck1)
    player2 = Player.new("Aurora", mad_deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards

    assert_equal turn.spoils_of_war, turn.pile_cards
  end

  def test_it_awards_no_spoils_to_turn_winner_type_mad
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)
    card3 = Card.new(:heart, '9', 9)
    card4 = Card.new(:diamond, 'Jack', 11)
    card5 = Card.new(:heart, '8', 8)
    card6 = Card.new(:diamond, 'Queen', 12)
    card7 = Card.new(:heart, '3', 3)
    card8 = Card.new(:diamond, '2', 2)
    card9 = Card.new(:diamond, "9", 9)

    mad_deck1 = Deck.new([card1, card2, card3, card5])
    mad_deck2 = Deck.new([card4, card6, card9, card8])

    player1 = Player.new("Megan", mad_deck1)
    player2 = Player.new("Aurora", mad_deck2)

    turn = Turn.new(player1, player2)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)

    assert_equal [card5], player1.deck.cards
    assert_equal [card8], player2.deck.cards
  end
end
