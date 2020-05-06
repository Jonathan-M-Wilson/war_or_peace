class Card
  attr_accessor :suit, :value, :rank
  def initialize(suit, value, rank)
    @suit = suit
    @rank = rank
    @value = value
  end
end
