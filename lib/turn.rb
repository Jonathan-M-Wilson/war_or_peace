class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @winner = winner
  end

  def type
    if @player1.deck.rank_of_card_at(0) !=
      @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) ==
      @player2.deck.rank_of_card_at(0) &&
      @player1.deck.rank_of_card_at(2) ==
      @player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    else
      :war
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      @winner.deck.cards << card
    end
  end

  def winner
    if type == :basic
      @player1 unless @player2.deck.rank_of_card_at(0) >
      @player1.deck.rank_of_card_at(0)
    elsif type == :war
      @player1 unless @player2.deck.rank_of_card_at(2) >
      @player1.deck.rank_of_card_at(2)
    else
      "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.cards.shift
      @spoils_of_war << @player2.deck.cards.shift
    elsif type == :war
      3.times do
        @spoils_of_war << @player1.deck.cards.shift
        @spoils_of_war << @player2.deck.cards.shift
      end
    elsif type == :mutually_assured_destruction
      3.times do
        @player1.deck.cards.shift
        @player2.deck.cards.shift
      end
    end
  end
end

#Add Comments
