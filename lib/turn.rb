class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = type
    @winner = winner
  end

  def type
    if @player1.deck.rank_of_card_at(0) !=
       @player2.deck.rank_of_card_at(0)
      :basic
    elsif @player1.deck.rank_of_card_at(0) ==
          @player2.deck.rank_of_card_at(0)
      :war
    elsif @player1.deck.rank_of_card_at(0..2) !=
          @player2.deck.rank_of_card_at(0..2)
      :mutually_assured_destruction
    end
  end

  def winner
    if type == :basic
      return @player1 unless @player2.deck.rank_of_card_at(0) >
             @player1.deck.rank_of_card_at(0)
    elsif type == :war
      return @player1 unless @player2.deck.rank_of_card_at(2) >
             @player1.deck.rank_of_card_at(2)
    elsif type == :mutually_assured_destruction
      return "No Winner"
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
      @winner.deck.cards << card
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
